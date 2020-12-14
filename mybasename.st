#! /bin/sh
"exec" "gst" "$0" "--smalltalk-args" "$@"

Object subclass: Basename [
    | args |

    Basename class >> new: n [
        | r |
        r := super new.
        r init: n. ^r
    ]

    init: n [ args := n substrings: '/']

    printOn: stream [
        args last displayOn: stream .
    ]

    printHelp [
        Transcript show: 'Usage: basename NAME [SUFFIX]' ; cr ;
        show: '  or:  basename OPTION... NAME...' ; cr ;
        show: 'Print NAME with any leading directory components removed.' ; cr ;
        show: 'If specified, also remove a trailing SUFFIX.' ; cr ;
        show: '' ; cr ;
        show: 'Mandatory arguments to long options are mandatory for short options too.' ; cr ;
        show: '  -a, --multiple       support multiple arguments and treat each as a NAME' ; cr ;
        show: '  -s, --suffix=SUFFIX  remove a trailing SUFFIX; implies -a' ; cr ;
        show: '  -z, --zero           end each output line with NUL, not newline' ; cr ;
        show: '      --help     display this help and exit' ; cr ;
        show: '      --version  output version information and exit' ; cr ;
        show: '' ; cr ;
        show: 'Examples:' ; cr ;
        show: '  basename /usr/bin/sort          -> "sort"' ; cr ;
        show: '  basename include/stdio.h .h     -> "stdio"' ; cr ;
        show: '  basename -s .h include/stdio.h  -> "stdio"' ; cr ;
        show: '  basename -a any/str1 any/str2   -> "str1" followed by "str2"' ; cr ;
        show: '' ; cr ;
        show: 'GNU coreutils online help: <https://www.gnu.org/software/coreutils/>' ; cr ;
        show: 'Full documentation at: <https://www.gnu.org/software/coreutils/basename>' ; cr ;
        show: 'or available locally via: info "(coreutils) basename invocation"' ; cr .
    ]

    printVersion [
        Transcript show: 'basename (GNU coreutils) 8.30' ; cr ;
        show: 'Copyright (C) 2018 Free Software Foundation, Inc.' ; cr ;
        show: 'License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.' ; cr ;
        show: 'This is free software: you are free to change and redistribute it.' ; cr ;
        show: 'There is NO WARRANTY, to the extent permitted by law.' ; cr ;
        show: '' ; cr ;
        show: 'Written by David MacKenzie.' ; cr .
    ]

    printBasename [
        Transcript show: args last ; cr .
    ]
]

args := Smalltalk arguments.

b := Basename new: args first.

(args first = '--help')
    ifTrue: [b printHelp];
    ifFalse: [
        (args first = '-a')
            ifTrue: [2 to: (args size) do: [:i | c := Basename new: (args at:i). c printBasename].];
            ifFalse: [
                (args first = '--multiple')
                    ifTrue: [2 to: (args size) do: [:i | c := Basename new: (args at:i). c printBasename].];
                    ifFalse: [
                        (args first = '--version')
                            ifTrue: [b printVersion];
                            ifFalse: [b printBasename].
                    ]
            ].      
    ]
