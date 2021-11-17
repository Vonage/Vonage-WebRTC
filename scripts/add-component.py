#!/usr/bin/env python

"""Script to add a new component to the Debian repository distributions file.

"""

import argparse
import logging
import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(sys.argv[0]))

def _ParseArgs():
    parser = argparse.ArgumentParser(description='Script to add a new component to the Debian repository distributions file.')
    parser.add_argument('--component',
                        required=True,
                        help='New component to be added to the Debian repository distributions file.')
    parser.add_argument('--verbose',
                        action='store_true',
                        default=False,
                        help='Verbose flag.')
    return parser.parse_args()

def AddComponent(component):
    distributions_filepath = os.path.join(SCRIPT_DIR, '..', 'conf', 'distributions')
    logging.debug('Adding new %s component in file %s', component, distributions_filepath)
    try:
        with open(distributions_filepath) as input:
            lines = input.readlines()
            with open(distributions_filepath, "w") as output:
                for line in lines:
                    if line.startswith('Components: '):
                        line = line.replace('Components: ', 'Components: ' + component + ' ')
                    output.write(line)
    except:
        logging.exception('Error with file %s', distributions_filepath)

def main():
    args = _ParseArgs()

    logging.basicConfig(level=logging.DEBUG if args.verbose else logging.INFO)

    AddComponent(args.component)

if __name__ == '__main__':
    sys.exit(main())
