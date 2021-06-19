#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse
import deepaccess.train as train
import deepaccess.interpret as interpret


def main():
    command_list = [train, interpret]
    command_list_str = ['train','interpret']
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=command_list_str)
    parser.add_argument("command_args",
                        help="command arguments",
                        nargs=argparse.REMAINDER
                        )
    parser.add_argument("-version", "--version",
                        action='store_true',
                        default=False)
    
    opts = parser.parse_args()

    if opts.version:
        print('deepaccess '+deepaccess.__version__)
    
    command = command_list[command_list_str.index(opts.command)]
    command_args = opts.command_args
    command.main(command_args)

if __name__ == "__main__":
    main()
