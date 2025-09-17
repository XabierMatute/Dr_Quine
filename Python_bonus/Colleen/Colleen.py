#!/usr/bin/env python3

'''
    This program will print its own source when run.
'''

def print_source():
    source = '#!/usr/bin/env python3\n\n\'\'\'\n    This program will print its own source when run.\n\'\'\'\n\ndef print_source():\n    source = %r\n    print(source %% source)\n\ndef main():\n    \'\'\'\n        This function prints the source code\n    \'\'\'\n    print_source()\n\nif __name__ == "__main__":\n    main()'
    print(source % source)

def main():
    '''
        This function prints the source code
    '''
    print_source()

if __name__ == "__main__":
    main()
