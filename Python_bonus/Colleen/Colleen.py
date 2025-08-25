
# This is a comment outside the main function

def print_source():
    source = '\n# This is a comment outside the main function\n\ndef print_source():\n    source = %r\n    print(source %% source)\n\ndef main():\n    # This is a comment inside the main function\n    print_source()\n\nif __name__ == "__main__":\n    main()\n'
    print(source % source)

def main():
    # This is a comment inside the main function
    print_source()

if __name__ == "__main__":
    main()

