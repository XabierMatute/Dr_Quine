#!/usr/bin/env python3

# This program will create a copy of its own source when run.
KIDNAME = "Grace_kid.py"
SOURCE = '#!/usr/bin/env python3\n\n# This program will create a copy of its own source when run.\nKIDNAME = "Grace_kid.py"\nSOURCE = %r\nMAIN = lambda: open(KIDNAME, \'w\').write(SOURCE %% SOURCE)\n\nif __name__ == "__main__":\n    MAIN()\n'
MAIN = lambda: open(KIDNAME, 'w').write(SOURCE % SOURCE)

if __name__ == "__main__":
    MAIN()
