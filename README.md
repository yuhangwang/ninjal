# ninjal
Combine Lua or C modules and the Lua interpreter  into one static binary using Ninja cross-platform build system

## Usage
Use `config.yaml` 
## Dependencies
- [ninjag](https://github.com/yuhangwang/ninjag-python)  
  This is tool for converting `yaml` configuration file to `ninja` make file.  
  Just do `pip install ninjag` will give you a command line tool `ninjag`.

- [ninja build system](https://github.com/ninja-build/ninja/releases)  
  This is a truly cross-platform build system with just a single binary for each  
  platform (Linux, Mac, and Windows).
  It is replacement of the Make build system. Fast and reliable.
  
- Lua/Luajit  
  I don't want to include the binary for Lua in the repository since  
  everyone probably have there favorite lua binary already.

## License
  MIT/X11 (c) Steven(Yuhang) Wang, 2017
