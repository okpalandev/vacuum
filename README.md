# Vacuum

## Overview

Vacuum is a lightweight numerical computation library for Lua, designed specifically for game development. It provides essential tools for manipulating vectors, matrices, and quaternions, making it ideal for handling physics within game environments. Inspired by concepts from physics, Vacuum aims to simplify complex mathematical operations commonly encountered in game development.

## Features

- **Vectors**: Supports 2D, 3D, and 4D vectors for efficient manipulation and calculations.
- **Matrices**: Provides functionality for 2D, 3D, and 4D matrices, facilitating linear algebra operations.
- **Quaternions**: Offers support for 3D rotations using quaternions, a crucial component for orientation in 3D space.

## Installation

### Using LuaRocks

bash
luarocks install vacuum


### Manual Installation

1. Clone the repository:

    bash
    git clone https://github.com/okpalandev/vacuum
    

2. Navigate to the cloned directory:

    bash
    cd vacuum
    

3. Install using LuaRocks:

    bash
    luarocks make
    

## Usage

lua
local vec2 = require("vacuum.vector.vec2")

local v1 = vec2:new(1, 2)
local v2 = vec2:new(3, 4)

local v3 = v1 + v2
print(v3.x, v3.y) -- Output: 4 6


## Documentation

For detailed documentation, please refer to the [Vacuum Documentation](https://okpalandev.github.io/vacuum/).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
