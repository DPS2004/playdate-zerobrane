## Playdate SDK integration for ZeroBrane Studio 

This project aims to allow [ZeroBrane Studio](https://zerobrane.com/) to support the [Playdate SDK and API](https://play.date/dev/). 

Current API version: 2.5.0


## Features

- Run on simulator and on hardware with a single button press
- Basic autocomplete support, based on [playdate-types](https://github.com/balpha/playdate-types)

## Installation and Usage

`playdate-zerobrane` can be installed by copying the `api` and `interpreters` folders to your ZeroBrane Studio install directory. Be sure to exit out of ZeroBrane Studio if it is running.

For the purpose of compiling and running your code, the `PLAYDATE_SDK_PATH` environment variable must be set, as described in [Inside Playdate](https://sdk.play.date/2.5.0/Inside%20Playdate.html#_set_playdate_sdk_path_environment_variable).

Once installed, `Playdate` can be selected as an option for a project's Lua interpreter.

Take care to ensure that your project path is the `Source` folder, and not the folder containing it!
![sourcedir](https://github.com/user-attachments/assets/d3e19091-dde8-44ed-baf1-2fb85ccf837a)

To run your program on the simulator, use the Run option from within ZeroBrane, by default mapped to F6.

To run your program on a real Playdate, first connect your system to your computer via USB, and ensure that it is unlocked (not on the clock screen). Then, use the Start Debugging option, by default mapped to F5.

![runs](https://github.com/user-attachments/assets/96a1d15f-7f90-45cc-b988-0dde7ad38b1b)


## License
This project makes use of code from the following projects:

[playdate-types](https://github.com/balpha/playdate-types) by [Benjamin Dumke-von der Ehe](https://github.com/balpha)

[inspect.lua](https://github.com/kikito/inspect.lua) by [Enrique García Cota](https://github.com/kikito) (MIT License)

All other code is under the MIT License. Please see the LICENSE file for more information.
