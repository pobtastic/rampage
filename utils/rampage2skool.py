#!/usr/bin/env python3
import sys
import os
import argparse
from collections import OrderedDict

try:
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool
except ImportError:
    SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
    if not SKOOLKIT_HOME:
        sys.stderr.write('SKOOLKIT_HOME is not set; aborting\n')
        sys.exit(1)
    if not os.path.isdir(SKOOLKIT_HOME):
        sys.stderr.write('SKOOLKIT_HOME={}; directory not found\n'.format(SKOOLKIT_HOME))
        sys.exit(1)
    sys.path.insert(0, SKOOLKIT_HOME)
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool

RAMPAGE_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUILD_DIR = '{}/sources'.format(RAMPAGE_HOME)
RAMPAGE_Z80 = '{}/Rampage.z80'.format(RAMPAGE_HOME)


class Rampage:
    def __init__(self, snapshot):
        self.snapshot = snapshot

    def address(self, addr):
        return self.snapshot[addr] + self.snapshot[addr + 0x01] * 0x100

    def get_buildings(self):
        lines = []

        addr = 0xCB2A
        start = 0xCB2A
        count = 0x00
        building = 0x01
        lines.append(f"b $CB29 Data: Buildings")
        lines.append(f"@ $CB29 label=Buildings_Data")
        lines.append(f"  $CB29,$01 Terminator.")
        while addr <= 0xCDE1:
            byte = self.snapshot[addr]
            if byte == 0xFF:
                lines = self.fill_in_building(lines, start, building, count)
                lines.append(f"  ${addr:04X},$01 Terminator.")
                addr += 0x01
                building += 0x01
                start = addr
                count = 0x00
            addr += 0x01
            count += 0x01
        count = 0xCDE1-start

        return '\n'.join(lines)

    def fill_in_building(self, lines, start, building, count):
        lines.append(f"N ${start:04X} Building #N${building:02X}.")
        lines.append(f"  ${start:04X},${count:02X}")
        return lines

    def get_scenes(self):
        lines = []

        addr = 0xCDE3
        start = 0xCDE3
        count = 0x00
        scene = 0x01
        lines.append(f"b $CDE2 Data: Scenes")
        lines.append(f"@ $CDE2 label=Scene_Data")
        lines.append(f"D $CDE2 For usage see #R$DF90.")
        lines.append(f"  $CDE2,$01 Terminator.")
        while addr <= 0xCFD2:
            byte = self.snapshot[addr]
            if byte == 0xFF:
                lines = self.fill_in_scene(lines, start, scene, count)
                lines.append(f"  ${addr:04X},$01 Terminator.")
                addr += 0x01
                scene += 0x01
                start = addr
                count = 0x00
            addr += 0x01
            count += 0x01
        count = 0xCFD2-start
        lines = self.fill_in_scene(lines, start, scene, count)

        return '\n'.join(lines)

    def fill_in_scene(self, lines, start, scene, count):
        lines.append(f"N ${start:04X} Scene #N${scene:02X}.")
        lines.append(f"  ${start:04X},$02")
        lines.append(f"  ${start+2:04X},$01 #TABLE(default,centre,centre) {{ =h Scene Type | =h Number Of Buildings }}")
        lines.append(". { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }")
        lines.append(". TABLE#")
        lines.append(f"  ${start+3:04X},${count-3:02X}")
        return lines


def run(subcommand):
    if not os.path.isdir(BUILD_DIR):
        os.mkdir(BUILD_DIR)
    if not os.path.isfile(RAMPAGE_Z80):
        tap2sna.main(('-d', BUILD_DIR, '@{}/rampage.t2s'.format(RAMPAGE_HOME)))
    rampage = Rampage(get_snapshot(RAMPAGE_Z80))
    ctlfile = '{}/{}.ctl'.format(BUILD_DIR, subcommand)
    with open(ctlfile, 'wt') as f:
        f.write(getattr(rampage, methods[subcommand][0])())

###############################################################################
# Begin
###############################################################################
methods = OrderedDict((
    ('buildings', ('get_buildings', 'Buildings (52542-55312)')),
    ('scenes', ('get_scenes', 'Scenes (52706-53201)'))
))
subcommands = '\n'.join('  {} - {}'.format(k, v[1]) for k, v in methods.items())
parser = argparse.ArgumentParser(
    usage='%(prog)s SUBCOMMAND',
    description="Produce a skool file snippet for \"Rampage\". SUBCOMMAND must be one of:\n\n{}".format(
        subcommands),
    formatter_class=argparse.RawTextHelpFormatter,
    add_help=False
)
parser.add_argument('subcommand', help=argparse.SUPPRESS, nargs='?')
namespace, unknown_args = parser.parse_known_args()
if unknown_args or namespace.subcommand not in methods:
    parser.exit(2, parser.format_help())
run(namespace.subcommand)
