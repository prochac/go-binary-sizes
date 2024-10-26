# Go 'Hello, World!' binary sizes

This is just a small experiment how the size of Go program can be reduced.

- the `-upx` suffix means that the binary was compressed with UPX.
- the `-max` suffix means that the binary was compressed with UPX using the
  slowest and most efficient compression.
- the `-tinygo` suffix means that the binary was compiled with TinyGo.
- the `-trim` suffix means that the Go binary was stripped of debug information.

| file      | Go   | Go UPX | Go UPX max | Go no-debug | Go no-debug UPX | Go no-debug UPX max | TinyGo | TinyGo UPX | TinyGo UPX max |
|-----------|------|--------|------------|-------------|-----------------|---------------------|--------|------------|----------------|
| print     | 1.5M | 950K   | 817K       | 957K        | 434K            | 351K                | 117K   | 50K        | 45K            |
| fmtprint  | 2.1M | 1.3M   | 1.1M       | 1.4M        | 604K            | 485K                | 630K   | 232K       | 190K           |
| hellohttp | 7.2M | 4.3M   | 3.6M       | 4.9M        | 2.1M            | 1.6M                | 2.2M   | 650K       | 507K           |

## Used versions

- go version go1.23.2 linux/amd64
- tinygo version 0.34.0 linux/amd64
  (using go version go1.23.2 and LLVM version 18.1.2)
- upx 4.2.4
