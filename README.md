# Tinker T

[Getting started with Coral AI](https://coral.ai/docs/dev-board-mini/get-started/)
[google-coral/pycoral](https://github.com/google-coral/pycoral)

[Edge TPU Compiler](https://coral.ai/docs/edgetpu/compiler/)

```sh
edgetpu_compiler -h
```

[pycoral](https://github.com/google-coral/pycoral)

## mdt

[Directions on how to use the mdt tool](https://coral.ai/docs/dev-board/mdt/#install-mdt)

- Disconnect the network and connect the USB. 
- This will allow you to connect to the board over serial
- Note that not all USB C cables will do data AND power (some just do power) so be sure to check `dmesg`

```sh
mdt shell
```

