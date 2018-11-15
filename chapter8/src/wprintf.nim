proc printf(format: cstring): cint {.importc, varargs, header: "stdio.h", discardable.}

printf("My name is %s and I am %d years old!\n", "Chris", 35)

proc displayFormatted(format: cstring): cint {.importc: "printf", varargs, header: "stdio.h", discardable.}

displayFormatted("My name is %s and I am %d years old!\n", "Chris", 35)
