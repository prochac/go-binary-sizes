# Go 'Hello, World!' binary sizes

This is just a small experiment how the size of Go program can be reduced.

| file                 | size |
|----------------------|------|
| go-fmtprint          | 1.9M |
| go-fmtprint-upx      | 1.2M |
| go-hellohttp         | 6.8M |
| go-hellohttp-upx     | 4.0M |
| go-print             | 1.4M |
| go-print-upx         | 862K |
| tinygo-fmtprint      | 586K |
| tinygo-fmtprint-upx  | 218K |
| tinygo-hellohttp     | 2.2M |
| tinygo-hellohttp-upx | 641K |
| tinygo-print         | 92K  |
| tinygo-print-upx     | 41K  |

## Used versions

- go version go1.22.2 linux/amd64
- tinygo version 0.31.2 linux/amd64
  (using go version go1.22.2 and LLVM version 17.0.1)
- upx 4.2.3