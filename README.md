# Go 'Hello, World!' binary sizes

This is just a small experiment how the size of Go program can be reduced.

- the `-upx` suffix means that the binary was compressed with UPX.
- the `-max` suffix means that the binary was compressed with UPX using the
  slowest and most efficient compression.
- the `-tinygo` suffix means that the binary was compiled with TinyGo.
- the `-trim` suffix means that the Go binary was stripped of debug information.

| file                      | size  |
|---------------------------|-------|
| fmtprint-go               | 1.9M  |
| fmtprint-go-trim          | 1.2M  |
| fmtprint-go-trim-upx      | 543K  |
| fmtprint-go-trim-upx-max  | 439K  |
| fmtprint-go-upx           | 1.2M  |
| fmtprint-go-upx-max       | 1013K |
| fmtprint-tinygo           | 586K  |
| fmtprint-tinygo-upx       | 218K  |
| fmtprint-tinygo-upx-max   | 178K  |
| hellohttp-go              | 6.8M  |
| hellohttp-go-trim         | 4.6M  |
| hellohttp-go-trim-upx     | 2.0M  |
| hellohttp-go-trim-upx-max | 1.6M  |
| hellohttp-go-upx          | 4.0M  |
| hellohttp-go-upx-max      | 3.4M  |
| hellohttp-tinygo          | 2.2M  |
| hellohttp-tinygo-upx      | 641K  |
| hellohttp-tinygo-upx-max  | 499K  |
| print-go                  | 1.4M  |
| print-go-trim             | 865K  |
| print-go-trim-upx         | 393K  |
| print-go-trim-upx-max     | 319K  |
| print-go-upx              | 862K  |
| print-go-upx-max          | 743K  |
| print-tinygo              | 92K   |
| print-tinygo-upx          | 41K   |
| print-tinygo-upx-max      | 37K   |

## Used versions

- go version go1.22.2 linux/amd64
- tinygo version 0.31.2 linux/amd64
  (using go version go1.22.2 and LLVM version 17.0.1)
- upx 4.2.3