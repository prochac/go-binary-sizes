# Go 'Hello, World!' binary sizes

This is just a small experiment how the size of Go program can be reduced.

- the `-upx` suffix means that the binary was compressed with UPX.
- the `-max` suffix means that the binary was compressed with UPX using the
  slowest and most efficient compression.
- the `-tinygo` suffix means that the binary was compiled with TinyGo.
- the `-trim` suffix means that the Go binary was stripped of debug information.

| file      | Go   | Go UPX | Go UPX max | Go no-debug | Go no-debug UPX | Go no-debug UPX max | TinyGo | TinyGo UPX | TinyGo UPX max |
|-----------|------|--------|------------|-------------|-----------------|---------------------|--------|------------|----------------|
| print     | 1.4M | 862K   | 743K       | 865K        | 393K            | 319K                | 92K    | 41K        | 37K            |
| fmtprint  | 1.9M | 1.2M   | 1013K      | 1.2M        | 543K            | 439K                | 586K   | 218K       | 178K           |
| hellohttp | 6.8M | 4.0M   | 3.4M       | 4.6M        | 2.0M            | 1.6M                | 2.2M   | 641K       | 499K           |

## Used versions

- go version go1.22.2 linux/amd64
- tinygo version 0.31.2 linux/amd64
  (using go version go1.22.2 and LLVM version 17.0.1)
- upx 4.2.3