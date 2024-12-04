return {
  READONLY_boolean = {
    type = "class"
  },
  READONLY_number = {
    type = "class"
  },
  READONLY_pd_point = {
    type = "class"
  },
  READONLY_pd_size = {
    type = "class"
  },
  import = {
    args = "(file: file)",
    description = "The Playdate runtime uses import instead of the standard Lua require function, and it behaves a little differently: All files imported from main.lua (and imported from files imported from main.lua, and so on) are compiled into a single pdz file, and import runs the code from the file only once. A second import call from anywhere in the pdz will do nothing.",
    type = "keyword"
  },
  json = {
    childs = {
      decode = {
        args = "(string: string))",
        description = "Takes the JSON encoded string and converts it to a Lua table.\nEquivalent to playdate->json->decode() in the C API.",
        returns = "(fun(string: string))",
        type = "function"
      },
      decodeFile = {
        args = "(fun(file: pd_file_file)) | (fun(path: string))",
        description = "Reads the given playdate.file.file object or the file at the given path and converts it to a Lua table.",
        returns = "((fun(file: pd_file_file)) | (fun(path: string)))",
        type = "function"
      },
      encode = {
        args = "(table: table)",
        description = "Returns a string containing the JSON representation of the passed-in Lua table.",
        returns = "(string)",
        type = "function"
      },
      encodePretty = {
        args = "(table: table)",
        description = "Returns a string containing the JSON representation of a Lua table, with human-readable formatting.",
        returns = "(string)",
        type = "function"
      },
      encodeToFile = {
        args = "(fun(file: pd_file_file, pretty?: boolean, table?: table)) | (fun(path: string, pretty?: boolean, table?: table))",
        description = "Encodes the Lua table table to JSON and writes it to the given playdate.file.file object or the given path. If pretty is true, the output is formatted to make it human-readable. Otherwise, no additional whitespace is added.\nFor a very simple way to serialize a table to a file, see playdate.datastore.",
        returns = "((fun(file: pd_file_file, pretty?: boolean, table?: table)) | (fun(path: string, pretty?: boolean, table?: table) | nil)",
        type = "function"
      }
    },
    type = "class"
  },
  pd_UNDOCUMENTED = {
    type = "class"
  },
  pd_affineTransform = {
    childs = {
      concat = {
        args = "(af: pd_affineTransform))",
        description = "Mutates the the caller. The affine transform `af` is concatenated to the caller.\nConcatenation combines two affine transformation matrices by multiplying them together. You might perform several concatenations in order to create a single affine transform that contains the cumulative effects of several transformations.\nNote that matrix operations are not commutative — the order in which you concatenate matrices is important. That is, the result of multiplying matrix t1 by matrix t2 does not necessarily equal the result of multiplying matrix t2 by matrix t1.",
        returns = "(fun(self: pd_affineTransform, af: pd_affineTransform))",
        type = "method"
      },
      copy = {
        args = "()",
        description = "Returns a new copy of the affine transform.",
        returns = "(pd_affineTransform)",
        type = "method"
      },
      invert = {
        args = "()",
        description = "Mutates the caller so that it is an affine transformation matrix constructed by inverting itself.\nInversion is generally used to provide reverse transformation of points within transformed objects. Given the coordinates (x, y), which have been transformed by a given matrix to new coordinates (x’, y’), transforming the coordinates (x’, y’) by the inverse matrix produces the original coordinates (x, y).",
        returns = "(fun(self: pd_affineTransform))",
        type = "method"
      },
      reset = {
        args = "()",
        description = "Mutates the the caller, changing it to an identity transform matrix.",
        returns = "(fun(self: pd_affineTransform))",
        type = "method"
      },
      rotate = {
        args = "(fun(self: pd_affineTransform, angle: number, x?: number, y?: number)) | (fun(self: pd_affineTransform, angle: number, point?: pd_point))",
        description = "### Overload 1 ###\nMutates the caller by applying a rotation transformation.\n`angle` is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional `x` and `y` arguments are given, the transform rotates around (`x`,`y`) instead of (0,0).\n### Overload 2 ###\nMutates the caller by applying a rotation transformation.\n`angle` is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional playdate.geometry.point `point` argument is given, the transform rotates around the `point` instead of (0,0).",
        returns = "((fun(self: pd_affineTransform, angle: number, x?: number, y?: number)) | (fun(self: pd_affineTransform, angle: number, point?: pd_point) | nil)",
        type = "function"
      },
      rotatedBy = {
        args = "(fun(self: pd_affineTransform, angle: number, x?: number, y?: number): pd_affineTransform) | (fun(self: pd_affineTransform, angle: number, point?: pd_point",
        description = "### Overload 1 ###\nReturns a copy of the calling affine transform with a rotate transformation appended.\n`angle` is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional `x` and `y` arguments are given, the transform rotates around (`x`,`y`) instead of (0,0).\n### Overload 2 ###\nReturns a copy of the calling affine transform with a rotate transformation appended.\n`angle` is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional point `point` argument is given, the transform rotates around the `point` instead of (0,0).",
        returns = "(pd_affineTransform))",
        type = "function"
      },
      scale = {
        args = "(sx: number, sy?: number))",
        description = "Mutates the caller by applying a scaling transformation.\nIf both parameters are passed, `sx` is used to scale the x values of the transform, `sy` is used to scale the y values.\nIf only one parameter is passed, it is used to scale both x and y values.",
        returns = "(fun(self: pd_affineTransform, sx: number, sy?: number | nil)",
        type = "method"
      },
      scaledBy = {
        args = "(sx: number, sy?: number)",
        description = "Returns a copy of the calling affine transform with a scaling transformation appended.\nIf both parameters are passed, `sx` is used to scale the x values of the transform, `sy` is used to scale the y values.\nIf only one parameter is passed, it is used to scale both x and y values.",
        returns = "(pd_affineTransform)",
        type = "method"
      },
      skew = {
        args = "(sx: number, sy: number))",
        description = "Mutates the caller, appending a skew transformation. `sx` is the value by which to skew the x axis, and `sy` the value for the y axis. Values are in degrees.",
        returns = "(fun(self: pd_affineTransform, sx: number, sy: number))",
        type = "method"
      },
      skewedBy = {
        args = "(sx: number, sy: number)",
        description = "Returns the given transform with a skew transformation appended. `sx` is the value by which to skew the x axis, and `sy` the value for the y axis. Values are in degrees.",
        returns = "(pd_affineTransform)",
        type = "method"
      },
      transformAABB = {
        args = "(r: pd_rect))",
        description = "Modifies the axis aligned bounding box `r` (a rect) by applying the affine transform.",
        returns = "(fun(self: pd_affineTransform, r: pd_rect))",
        type = "method"
      },
      transformLineSegment = {
        args = "(ls: pd_lineSegment))",
        description = "Modifies the line segment `ls` by applying the affine transform.",
        returns = "(fun(self: pd_affineTransform, ls: pd_lineSegment))",
        type = "method"
      },
      transformPoint = {
        args = "(p: pd_point))",
        description = "Modifies the point `p` by applying the affine transform.",
        returns = "(fun(self: pd_affineTransform, p: pd_point))",
        type = "method"
      },
      transformPolygon = {
        args = "(p: pd_polygon))",
        description = "Modifies the polygon `p` by applying the affine transform.",
        returns = "(fun(self: pd_affineTransform, p: pd_polygon))",
        type = "method"
      },
      transformXY = {
        args = "(x: number, y: number)",
        description = "Returns two values calculated by applying the affine transform to the point (`x`, `y`)",
        returns = "((number, number))",
        type = "method"
      },
      transformedAABB = {
        args = "(r: pd_rect)",
        description = "As above, but returns a new rect rather than modifying `r`.",
        returns = "(pd_rect)",
        type = "method"
      },
      transformedLineSegment = {
        args = "(ls: pd_lineSegment)",
        description = "As above, but returns a new line segment rather than modifying `ls`.",
        returns = "(pd_lineSegment)",
        type = "method"
      },
      transformedPoint = {
        args = "(p: pd_point)",
        description = "As above, but returns a new point rather than modifying `p`.",
        returns = "(pd_point)",
        type = "method"
      },
      transformedPolygon = {
        args = "(p: pd_polygon)",
        description = "As above, but returns a new polygon rather than modifying `p`.",
        returns = "(pd_polygon)",
        type = "method"
      },
      translate = {
        args = "(dx: number, dy: number))",
        description = "Mutates the caller by applying a translate transformation. x values are moved by `dx`, y values by `dy`.",
        returns = "(fun(self: pd_affineTransform, dx: number, dy: number))",
        type = "method"
      },
      translatedBy = {
        args = "(dx: number, dy: number)",
        description = "Returns a copy of the calling affine transform with a translate transformation appended.",
        returns = "(pd_affineTransform)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_animator = {
    childs = {
      currentValue = {
        args = "()",
        description = "Returns the current value of the animation, which will be either a number or a playdate.geometry.point, depending on the type of animator.",
        returns = "(number|pd_point)",
        type = "method"
      },
      easingAmplitude = {
        description = "For easing functions that take additional amplitude (such as `inOutElastic`), set these values on animator instances to the desired values.",
        returns = "(number)",
        type = "value"
      },
      easingPeriod = {
        description = "For easing functions that take additional period arguments (such as `inOutElastic`), set these values on animator instances to the desired values.",
        returns = "(number)",
        type = "value"
      },
      ended = {
        args = "()",
        description = "Returns true if the animation is completed. Only returns true if this function or currentValue() has been called since the animation ended in order to allow animations to fully finish before true is returned.",
        returns = "(boolean)",
        type = "method"
      },
      progress = {
        args = "()",
        description = "Returns the current progress of the animation as a value from 0 to 1.",
        returns = "(number)",
        type = "method"
      },
      repeatCount = {
        description = "Indicates the number of times after the initial animation the animator should repeat; i.e., if repeatCount is set to 2, the animation will play through 3 times.",
        returns = "(number)",
        type = "value"
      },
      reset = {
        args = "(duration?: number))",
        description = "Resets the animation, setting its start time to the current time, and changes the animation’s duration if a new duration is given.",
        returns = "(fun(self: pd_animator, duration?: number | nil)",
        type = "method"
      },
      reverses = {
        description = "If set to true, after the animation reaches the end, it runs in reverse from the end to the start. The time to complete both the forward and reverse will be `duration` x 2. Defaults to false.",
        returns = "(boolean)",
        type = "value"
      },
      valueAtTime = {
        args = "(time: number)",
        description = "Returns the value of the animation at the given number of milliseconds after the start time. The value will be either a number or a playdate.geometry.point, depending on the type of animator.",
        returns = "(number|pd_point)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_arc = {
    childs = {
      clockwise = {
        description = "You can directly read or write the `x`, `y`, `radius`, `startAngle`, `endAngle` and `clockwise` values of an arc.",
        returns = "(boolean)",
        type = "value"
      },
      copy = {
        args = "()",
        description = "Returns a new copy of the arc.",
        returns = "(pd_arc)",
        type = "method"
      },
      endAngle = {
        description = "You can directly read or write the `x`, `y`, `radius`, `startAngle`, `endAngle` and `clockwise` values of an arc.",
        returns = "(number)",
        type = "value"
      },
      isClockwise = {
        args = "()",
        description = "Returns true if the direction of the arc is clockwise.",
        returns = "(boolean)",
        type = "method"
      },
      length = {
        args = "()",
        description = "Returns the length of the arc.",
        returns = "(number)",
        type = "method"
      },
      new = {
        args = "(x: number, y: number, radius: number, startAngle: number, endAngle: number, direction?: boolean)",
        description = "Returns the transform created by multiplying transform `t1` by transform `t2`\nReturns the vector2D created by applying the transform `t` to the vector2D v\nReturns the point created by applying the transform `t` to the point `p`\nReturns a new playdate.geometry.arc. Angles should be specified in degrees. Zero degrees represents the top of the circle.\nIf specified, `direction` should be true for clockwise, false for counterclockwise. If not specified, the direction is inferred from the start and end angles.",
        returns = "(pd_arc)",
        type = "function"
      },
      pointOnArc = {
        args = "(distance: number, extend?: boolean)",
        description = "Returns a new point on the arc, distance pixels from the arc’s start angle. If extend is true, the returned point is allowed to project past the arc’s endpoints; otherwise, it is constrained to the arc’s initial point if distance is negative, or the end point if distance is greater than the arc’s length.",
        returns = "(pd_arc)",
        type = "method"
      },
      radius = {
        description = "You can directly read or write the `x`, `y`, `radius`, `startAngle`, `endAngle` and `clockwise` values of an arc.",
        returns = "(number)",
        type = "value"
      },
      setIsClockwise = {
        args = "(flag: boolean))",
        description = "Sets the direction of the arc.",
        returns = "(fun(self: pd_arc, flag: boolean))",
        type = "method"
      },
      startAngle = {
        description = "You can directly read or write the `x`, `y`, `radius`, `startAngle`, `endAngle` and `clockwise` values of an arc.",
        returns = "(number)",
        type = "value"
      },
      x = {
        description = "You can directly read or write the `x`, `y`, `radius`, `startAngle`, `endAngle` and `clockwise` values of an arc.",
        returns = "(number)",
        type = "value"
      },
      y = {
        description = "You can directly read or write the `x`, `y`, `radius`, `startAngle`, `endAngle` and `clockwise` values of an arc.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_bitcrusher = {
    childs = {
      setAmount = {
        args = "(amt: number))",
        description = "Sets the amount of crushing to `amt`. Valid values are 0 (no effect) to 1 (quantizing output to 1-bit).",
        returns = "(fun(self: pd_bitcrusher, amt: number))",
        type = "method"
      },
      setAmountMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the filter level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_bitcrusher, signal: pd_signal? | nil)",
        type = "method"
      },
      setMix = {
        args = "(level: number))",
        description = "Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.",
        returns = "(fun(self: pd_bitcrusher, level: number))",
        type = "method"
      },
      setMixMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the mix level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_bitcrusher, signal: pd_signal? | nil)",
        type = "method"
      },
      setUndersampling = {
        args = "(amt: number))",
        description = "Sets the number of samples to repeat; 0 is no undersampling, 1 effectively halves the sample rate.",
        returns = "(fun(self: pd_bitcrusher, amt: number))",
        type = "method"
      },
      setUndersamplingMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the filter level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_bitcrusher, signal: pd_signal? | nil)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_blinker = {
    childs = {
      remove = {
        args = "()",
        description = "Flags the caller for removal from the global list of blinkers",
        returns = "(fun(self: pd_blinker))",
        type = "method"
      },
      start = {
        args = "(onDuration?: number, offDuration?: number, loop?: boolean, cycles?: integer, default?: boolean))",
        description = "Starts a blinker if it’s not running. Pass values for any property values you wish to modify.",
        returns = "(fun(self: pd_blinker, onDuration?: number, offDuration?: number, loop?: boolean, cycles?: integer, default?: boolean | nil)",
        type = "method"
      },
      startLoop = {
        args = "()",
        description = "Starts a blinker if it’s not running and sets its loop property to true. Equivalent to calling playdate.graphics.animation.blinker:start(nil, nil, true)",
        returns = "(fun(self: pd_blinker))",
        type = "method"
      },
      stop = {
        args = "()",
        description = "Stops a blinker if it’s running, returning the blinker’s on properly to the default value.",
        returns = "(fun(self: pd_blinker))",
        type = "method"
      },
      update = {
        args = "()",
        description = "Updates the caller’s state.",
        returns = "(fun(self: pd_blinker))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_button = {
    type = "class"
  },
  pd_capitalization = {
    type = "class"
  },
  pd_channel = {
    childs = {
      addEffect = {
        args = "(effect: pd_effect))",
        description = "Adds an effect to the channel.",
        returns = "(fun(self: pd_channel, effect: pd_effect))",
        type = "method"
      },
      addSource = {
        args = "(source: pd_source))",
        description = "Adds a source to the channel. If a source is not assigned to a channel, it plays on the default global channel.",
        returns = "(fun(self: pd_channel, source: pd_source))",
        type = "method"
      },
      getDryLevelSignal = {
        args = "()",
        description = "Returns a signal that follows the volume of the channel before effects are applied.",
        returns = "(pd_signal)",
        type = "method"
      },
      getVolume = {
        args = "()",
        description = "Gets the volume (0.0 - 1.0) for the channel.",
        returns = "(number)",
        type = "method"
      },
      getWetLevelSignal = {
        args = "()",
        description = "Returns a signal that follows the volume of the channel after effects are applied.",
        returns = "(pd_signal)",
        type = "method"
      },
      remove = {
        args = "()",
        description = "Removes the channel from the global list.",
        returns = "(fun(self: pd_channel))",
        type = "method"
      },
      removeEffect = {
        args = "(effect: pd_effect))",
        description = "Removes an effect from the channel.",
        returns = "(fun(self: pd_channel, effect: pd_effect))",
        type = "method"
      },
      removeSource = {
        args = "(source: pd_source))",
        description = "Removes a source from the channel.",
        returns = "(fun(self: pd_channel, source: pd_source))",
        type = "method"
      },
      setPan = {
        args = "(pan: number))",
        description = "Sets the pan parameter for the channel. -1 is left, 0 is center, and 1 is right.",
        returns = "(fun(self: pd_channel, pan: number))",
        type = "method"
      },
      setPanMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to automate the pan parameter. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_channel, signal: pd_signal? | nil)",
        type = "method"
      },
      setVolume = {
        args = "(volume: number))",
        description = "Sets the volume (0.0 - 1.0) for the channel.",
        returns = "(fun(self: pd_channel, volume: number))",
        type = "method"
      },
      setVolumeMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to automate the volume parameter. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_channel, signal: pd_signal? | nil)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_collision_type = {
    type = "class"
  },
  pd_color = {
    type = "class"
  },
  pd_controlsignal = {
    childs = {
      addEvent = {
        args = "(fun(self: pd_controlsignal, step: number, value: number, interpolate?: boolean)) | (fun(self: pd_controlsignal, event: pd_event))",
        description = "addEvent is a simpler way of adding events one at a time than setting the entire `events` table. Arguments are either the values themselves in the given order, or a table containing values for step, value, and optionally interpolate.",
        returns = "((fun(self: pd_controlsignal, step: number, value: number, interpolate?: boolean)) | (fun(self: pd_controlsignal, event: pd_event) | nil)",
        type = "function"
      },
      clearEvents = {
        args = "()",
        description = "Clears all events from the control signal.",
        returns = "(fun(self: pd_controlsignal))",
        type = "method"
      },
      events = {
        description = "The signal’s event list is modified by getting and setting the events property of the object. This is an array of tables, each containing values for keys step and value, and optionally interpolate.",
        returns = "(pd_event[])",
        type = "value"
      },
      getControllerType = {
        args = "()",
        description = "Control signals in midi files are assigned a controller number, which describes the intent of the control. This function returns the controller number.",
        returns = "(number)",
        type = "method"
      },
      getValue = {
        args = "()",
        description = "Returns the current output value of the control signal.",
        returns = "(number)",
        type = "method"
      },
      setControllerType = {
        args = "(number: number))",
        description = "Sets the midi controller number for the control signal, if that’s something you want to do. The value has no effect on playback.",
        returns = "(fun(self: pd_controlsignal, number: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_crankIndicator = {
    childs = {
      clockwise = {
        description = "Boolean property specifying which direction to animate the crank. Defaults to true.",
        returns = "(boolean)",
        type = "value"
      },
      draw = {
        args = "(xOffset?: number, yOffset?: number))",
        description = "Draws the next frame of the crank indicator animation, and is typically invoked in the playdate.update() callback. `xOffset` and `yOffset` can be used to alter the position of the indicator by a specified number of pixels if desired. To stop drawing the crank indicator, simply stop calling :draw() in playdate.update().\nNote that if sprites are being used, this call should usually happen after playdate.graphics.sprite.update().",
        returns = "(fun(self: pd_crankIndicator, xOffset?: number, yOffset?: number | nil)",
        type = "method"
      },
      getBounds = {
        args = "()",
        description = "Returns `x`, `y`, `width`, `height` representing the bounds that the crank indicator draws within. If necessary, this rect could be passed into playdate.graphics.sprite.addDirtyRect(), or used to manually draw over the indicator image drawn by playdate.ui.crankIndicator:draw() when you want to stop showing the crank indicator.",
        returns = "((number, number, number, number))",
        type = "method"
      },
      resetAnimation = {
        args = "()",
        description = "Resets the crank animation to the beginning of its sequence.",
        returns = "(fun(self: pd_crankIndicator))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_delayline = {
    childs = {
      addTap = {
        args = "(delay: number)",
        description = "Returns a new playdate.sound.delaylinetap on the delay line, at the given delay (which must be less than or equal to the delay line’s length).",
        returns = "(pd_delayline)",
        type = "method"
      },
      setFeedback = {
        args = "(level: number))",
        description = "Sets the feedback level of the delay line.",
        returns = "(fun(self: pd_delayline, level: number))",
        type = "method"
      },
      setMix = {
        args = "(level: number))",
        description = "Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix, which is useful if you’re using taps for varying delays.",
        returns = "(fun(self: pd_delayline, level: number))",
        type = "method"
      },
      setMixMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the mix level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_delayline, signal: pd_signal? | nil)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_delaylinetap = {
    childs = {
      getVolume = {
        args = "()",
        description = "Returns the tap’s volume.",
        returns = "(number)",
        type = "method"
      },
      setDelay = {
        args = "(time: number))",
        description = "Sets the position of the tap on the delay line, up to the delay line’s length.",
        returns = "(fun(self: pd_delaylinetap, time: number))",
        type = "method"
      },
      setDelayMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the tap delay. If the signal is continuous (e.g. an envelope or a triangle LFO, but not a square LFO) playback is sped up or slowed down to compress or expand time. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_delaylinetap, signal: pd_signal? | nil)",
        type = "method"
      },
      setFlipChannels = {
        args = "(flag: boolean))",
        description = "If set and the delay line is stereo, the tap outputs the delay line’s left channel to its right output and vice versa.",
        returns = "(fun(self: pd_delaylinetap, flag: boolean))",
        type = "method"
      },
      setVolume = {
        args = "(level: number))",
        description = "Sets the tap’s volume.",
        returns = "(fun(self: pd_delaylinetap, level: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_dither_type = {
    type = "class"
  },
  pd_draw_mode = {
    type = "class"
  },
  pd_envelope = {
    childs = {
      getValue = {
        args = "()",
        description = "Returns the current signal value of the envelope.",
        returns = "(number)",
        type = "method"
      },
      setAttack = {
        args = "(attack: number))",
        description = "Sets the envelope attack time to `attack`, in seconds.",
        returns = "(fun(self: pd_envelope, attack: number))",
        type = "method"
      },
      setCurvature = {
        args = "(amount: number))",
        description = "Smoothly changes the envelope’s shape from linear (amount=0) to exponential (amount=1).",
        returns = "(fun(self: pd_envelope, amount: number))",
        type = "method"
      },
      setDecay = {
        args = "(decay: number))",
        description = "Sets the envelope decay time to `decay`, in seconds.",
        returns = "(fun(self: pd_envelope, decay: number))",
        type = "method"
      },
      setGlobal = {
        args = "(flag: boolean))",
        description = "If an envelope is marked global, it is continuously updated whether or not it’s attached to any source.",
        returns = "(fun(self: pd_envelope, flag: boolean))",
        type = "method"
      },
      setLegato = {
        args = "(flag: boolean))",
        description = "Sets whether to use legato phrasing for the envelope. If the legato flag is set, when the envelope is re-triggered before it’s released, it remains in the sustain phase instead of jumping back to the attack phase.",
        returns = "(fun(self: pd_envelope, flag: boolean))",
        type = "method"
      },
      setOffset = {
        args = "(offset: number))",
        description = "Sets the offset value for the envelope. The transformed envelope has an initial value of `offset` and a maximum (minimum if `scale` is negative) of `offset` + `scale`.",
        returns = "(fun(self: pd_envelope, offset: number))",
        type = "method"
      },
      setRateScaling = {
        args = "(scaling: number, start?: number|string, end?: number|string))",
        description = 'Scales the envelope rate according to the played note. For notes below start, the envelope’s set rate is used; for notes above end envelope rates are scaled by the scaling parameter. Between the two notes the scaling factor is interpolated from 1.0 to scaling. start and end are either MIDI note numbers or names like "C4". If omitted, the default range is C1 (36) to C5 (84).',
        returns = "(fun(self: pd_envelope, scaling: number, start?: number|string, end?: number|string | nil)",
        type = "method"
      },
      setRelease = {
        args = "(release: number))",
        description = "Sets the envelope release time to `release`, in seconds.",
        returns = "(fun(self: pd_envelope, release: number))",
        type = "method"
      },
      setRetrigger = {
        args = "(flag: boolean))",
        description = "If retrigger is on, the envelope always starts from 0 when a note starts playing, instead of the current value if it’s active.",
        returns = "(fun(self: pd_envelope, flag: boolean))",
        type = "method"
      },
      setScale = {
        args = "(scale: number))",
        description = "Sets the scale value for the envelope. The transformed envelope has an initial value of `offset` and a maximum (minimum if `scale` is negative) of `offset` + `scale`.",
        returns = "(fun(self: pd_envelope, scale: number))",
        type = "method"
      },
      setSustain = {
        args = "(sustain: number))",
        description = "Sets the envelope sustain level to `sustain`, as a proportion of the maximum. For example, if the sustain level is 0.5, the signal value rises to its full value over the attack phase of the envelope, then drops to half its maximum over the decay phase, and remains there while the envelope is active.",
        returns = "(fun(self: pd_envelope, sustain: number))",
        type = "method"
      },
      setVelocitySensitivity = {
        args = "(amount: number))",
        description = "Changes the amount by which note velocity scales output level. At the default value of 1, output is proportional to velocity; at 0 velocity has no effect on output level.",
        returns = "(fun(self: pd_envelope, amount: number))",
        type = "method"
      },
      trigger = {
        args = "(velocity: number, length?: number))",
        description = "Triggers the envelope at the given `velocity`. If a `length` parameter is given, the envelope moves to the release phase after the given time. Otherwise, the envelope is held in the sustain phase until the trigger function is called again with `velocity` equal to zero.",
        returns = "(fun(self: pd_envelope, velocity: number, length?: number | nil)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_event = {
    childs = {
      interpolate = {
        returns = "(boolean? -- ?)",
        type = "value"
      },
      step = {
        returns = "(number)",
        type = "value"
      },
      value = {
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_file_file = {
    childs = {
      close = {
        args = "()",
        description = "Closes the file.\nEquivalent to playdate->file->close() in the C API.",
        returns = "(fun(self: pd_file_file))",
        type = "method"
      },
      flush = {
        args = "()",
        description = "Flushes any buffered data written to the file to the disk.\nEquivalent to playdate->file->flush() in the C API.",
        returns = "(fun(self: pd_file_file))",
        type = "method"
      },
      read = {
        args = "(numberOfBytes: number)",
        description = "Returns a buffer containing up to `numberOfBytes` bytes from the file, and the number of bytes read. If the read failed, the function returns nil and a second value describing the error.\nEquivalent to playdate->file->read() in the C API.",
        returns = "(pd_UNDOCUMENTED)",
        type = "method"
      },
      readline = {
        args = "()",
        description = "Returns the next line of the file, delimited by either \\n or \\r\\n. The returned string does not include newline characters.",
        returns = "(string)",
        type = "method"
      },
      seek = {
        args = "(offset: number, whence?: pd_seek_mode))",
        description = "Sets the file read/write position to the given byte offset. whence, if given is one of the following:\nplaydate.file.kSeekSet: offset is an absolute offset from the start of the file\nplaydate.file.kSeekFromCurrent: offset is relative to the current position\nplaydate.file.kSeekFromEnd: offset is an offset from the end of the file (negative values are before the end, positive are past the end)\nEquivalent to playdate->file->seek() in the C API.",
        returns = "(fun(self: pd_file_file, offset: number, whence?: pd_seek_mode | nil)",
        type = "method"
      },
      tell = {
        args = "()",
        description = "Returns the current byte offset of the read/write position in the file.\nEquivalent to playdate->file->tell() in the C API.",
        returns = "(number)",
        type = "method"
      },
      write = {
        args = "(string: string)",
        description = "Writes the given string to the file and returns the number of bytes written if successful, or 0 and a second return value describing the error. If you wish to include line termination characters (\\n, \\r), please include them in the string.",
        returns = "(number)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_file_time_table = {
    childs = {
      day = {
        returns = "(number)",
        type = "value"
      },
      hour = {
        returns = "(number)",
        type = "value"
      },
      minute = {
        returns = "(number)",
        type = "value"
      },
      month = {
        returns = "(number)",
        type = "value"
      },
      second = {
        returns = "(number)",
        type = "value"
      },
      year = {
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_filemode = {
    type = "class"
  },
  pd_fileplayer = {
    childs = {
      didUnderrun = {
        args = "()",
        description = "Returns the fileplayer’s underrun flag, indicating that the player ran out of data. This can be checked in the finish callback function to check for an underrun error.",
        returns = "(boolean)",
        type = "method"
      },
      getLength = {
        args = "()",
        description = "Returns the length, in seconds, of the audio file.",
        returns = "(number)",
        type = "method"
      },
      getOffset = {
        args = "()",
        description = "Returns the current offset of the fileplayer, in seconds. This value is not adjusted for rate.",
        returns = "(number)",
        type = "method"
      },
      getRate = {
        args = "()",
        description = "Returns the playback rate for the file. as set with setRate().",
        returns = "(number)",
        type = "method"
      },
      getVolume = {
        args = "()",
        description = "Returns the current volume for the fileplayer, a single value for mono sources or a pair of values (left, right) for stereo sources.",
        returns = "(number)",
        type = "method"
      },
      isPlaying = {
        args = "()",
        description = "Returns a boolean indicating whether the fileplayer is playing.",
        returns = "(boolean)",
        type = "method"
      },
      load = {
        args = "(path: string))",
        description = "Instructs the fileplayer to load the file at `path` when play() is called on it. The fileplayer must not be playing when this function is called. The fileplayer’s play offset is reset to the beginning of the file, and its loop range is cleared.",
        returns = "(fun(self: pd_fileplayer, path: string))",
        type = "method"
      },
      pause = {
        args = "()",
        description = "Stops playing the file. A subsequent play() call resumes playback from where it was paused.",
        returns = "(fun(self: pd_fileplayer))",
        type = "method"
      },
      play = {
        args = "(repeatCount?: number)",
        description = "Opens and starts playing the file, first creating and filling a 1/4 second playback buffer if a buffer size hasn’t been set yet.\nIf repeatCount is set, playback repeats when it reaches the end of the file or the end of the loop range if one is set. After the loop has run `repeatCount` times, it continues playing to the end of the file. A `repeatCount` of zero loops endlessly. If repeatCount is not set, the file plays once.\nThe function returns true if the file was successfully opened and the fileplayer added to the sound channel, otherwise false and a string describing the error.",
        returns = "(boolean)",
        type = "method"
      },
      setBufferSize = {
        args = "(seconds: number)",
        description = "Sets the buffer size for the fileplayer, in seconds. Larger buffers protect against buffer underruns, but consume more memory. Calling this function also fills the output buffer if a source file has been set. On success, the function returns `true`; otherwise it returns `false` and a string describing the error.",
        returns = "(boolean)",
        type = "method"
      },
      setFinishCallback = {
        args = "(func: fun(pd_fileplayer, any), arg?: any))",
        description = "Sets a function to be called when playback has completed. The fileplayer is passed as the first argument to `func`. The optional argument `arg` is passed as the second.",
        returns = "(fun(self: pd_fileplayer, func: fun(pd_fileplayer, any), arg?: any | nil)",
        type = "method"
      },
      setLoopCallback = {
        args = "(callback: fun(pd_fileplayer, any), arg?: any))",
        description = "Sets a function to be called every time the fileplayer loops. The fileplayer object is passed to this function as the first argument, and `arg` as the second.\nThe fileplayer:play([repeatCount]) call needs to be invoked with a `repeatCount` value of 0 (infinite looping), or 2 or greater in order for the loop callback to be invoked.",
        returns = "(fun(self: pd_fileplayer, callback: fun(pd_fileplayer, any), arg?: any | nil)",
        type = "method"
      },
      setLoopRange = {
        args = "(start: number, end?: number, loopCallback?: fun(pd_fileplayer, any), arg?: any))",
        description = 'Provides a way to loop a portion of an audio file. In the following code:\nlocal fp = playdate.sound.fileplayer.new( "myaudiofile" )\nfp:setLoopRange( 10, 20 )\nfp:play( 3 )\n…the fileplayer will start playing from the beginning of the audio file, loop the 10-20 second range three times, and then stop playing.\n`start` and `end` are specified in seconds. If `end` is omitted, the end of the file is used. If the function `loopCallback` is provided, it is called every time the player loops, with the fileplayer as the first argument and the optional `arg` argument as the second.\nThe fileplayer:play([repeatCount]) call needs to be invoked with a `repeatCount` value of 0 (infinite looping), or 2 or greater in order for the looping action to happen.',
        returns = "(fun(self: pd_fileplayer, start: number, end?: number, loopCallback?: fun(pd_fileplayer, any), arg?: any | nil)",
        type = "method"
      },
      setOffset = {
        args = "(seconds: number))",
        description = "Sets the current offset of the fileplayer, in seconds. This value is not adjusted for rate.",
        returns = "(fun(self: pd_fileplayer, seconds: number))",
        type = "method"
      },
      setRate = {
        args = "(rate: number))",
        description = "Sets the playback rate for the file. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Unlike sampleplayers, fileplayers can’t play in reverse (i.e., rate < 0).",
        returns = "(fun(self: pd_fileplayer, rate: number))",
        type = "method"
      },
      setRateMod = {
        args = "(signal: pd_signal?))",
        description = "Sets the signal to use as a rate modulator, added to the rate set with playdate.sound.fileplayer:setRate(). Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_fileplayer, signal: pd_signal? | nil)",
        type = "method"
      },
      setStopOnUnderrun = {
        args = "(flag: boolean))",
        description = "By default, the fileplayer stops playback if it can’t provide data fast enough. Setting the flag to `false` tells the fileplayer to restart playback (after an audible stutter) as soon as data is available.",
        returns = "(fun(self: pd_fileplayer, flag: boolean))",
        type = "method"
      },
      setVolume = {
        args = "(left: number, right?: number, fadeSeconds?: number, fadeCallback?: fun(pd_fileplayer, any), arg?: any))",
        description = "Sets the playback volume (0.0 - 1.0). If a single value is passed in, both left side and right side volume are set to the given value. If two values are given, volumes are set separately. The optional `fadeSeconds` specifies the time it takes to fade from the current volume to the specified volume, in seconds. If the function `fadeCallback` is given, it is called when the volume fade has completed. The fileplayer object is passed as the first argument to the callback, and the optional `arg` argument is passed as the second.",
        returns = "(fun(self: pd_fileplayer, left: number, right?: number, fadeSeconds?: number, fadeCallback?: fun(pd_fileplayer, any), arg?: any | nil)",
        type = "method"
      },
      stop = {
        args = "()",
        description = "Stops playing the file, resets the playback offset to zero, and calls the finish callback.",
        returns = "(fun(self: pd_fileplayer))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_flip = {
    type = "class"
  },
  pd_font = {
    childs = {
      drawText = {
        args = "(fun(self: pd_font, text: string, x: number, y: number, width?: number, height?: number, leadingAdjustment?: number, wrapMode?: pd_wrap_mode, alignment?: pd_text_alignment): (number, number)) | (fun(self: pd_font, text: string, rect: pd_rect, leadingAdjustment?: number, wrapMode?: pd_wrap_mode, alignment?: pd_text_alignment",
        description = 'Draws a string at the specified `x, y` coordinate using this particular font instance. (Compare to playdate.graphics.drawText(text, x, y), which draws the string with whatever the "current font" is, as defined by playdate.graphics.setFont(font)).\nIf `width` and `height` are specified, drawing is constrained to the rectangle (x,y,width,height), using the given wrapMode and alignment if provided. Alternatively, a playdate.geometry.rect object can be passed instead of x,y,width,height. Valid values for `wrapMode` are\n`playdate.graphics.kWrapClip`\n`playdate.graphics.kWrapCharacter`\n`playdate.graphics.kWrapWord`\nand values for `alignment` are\n`playdate.graphics.kAlignLeft`\n`playdate.graphics.kAlignCenter`\n`playdate.graphics.kAlignRight`\nThe default wrap mode is playdate.graphics.kWrapWord and the default alignment is playdate.graphics.kAlignLeft.\nThe optional `leadingAdjustment` may be used to modify the spacing between lines of text.\nThe function returns two numbers indicating the width and height of the drawn text.\nfont:drawText() does not support inline styles like bold and italics. Instead use playdate.graphics.drawText().',
        returns = "((number, number)))",
        type = "function"
      },
      drawTextAligned = {
        args = "(text: string, x: number, y: number, alignment: pd_text_alignment, leadingAdjustment?: number))",
        description = 'You must import `CoreLibs/graphics` to use this function.\nDraws the string `text` aligned to the left, right, or centered on the `x` coordinate. Pass one of `kTextAlignment.left`, `kTextAlignment.center`, `kTextAlignment.right` for the `alignment` parameter. (Compare to playdate.graphics.drawTextAligned(text, x, y, alignment), which draws the string with the "current font", as defined by playdate.graphics.setFont(font)).',
        returns = "(fun(self: pd_font, text: string, x: number, y: number, alignment: pd_text_alignment, leadingAdjustment?: number | nil)",
        type = "method"
      },
      getGlyph = {
        args = "(character: string|number)",
        description = "Returns the playdate.graphics.image containing the requested glyph. `character` can either be a string or a unicode codepoint number.",
        returns = "(pd_image)",
        type = "method"
      },
      getHeight = {
        args = "()",
        description = "Returns the pixel height of this font.",
        returns = "(number)",
        type = "method"
      },
      getLeading = {
        args = "()",
        description = "Returns the leading (spacing between lines) of this font, in pixels.",
        returns = "(number)",
        type = "method"
      },
      getTextWidth = {
        args = "(text: string)",
        description = "Returns the pixel width of the text when rendered with this font.",
        returns = "(number)",
        type = "method"
      },
      getTracking = {
        args = "()",
        description = "Returns the tracking of this font (spacing between letters), in pixels.\nEquivalent to playdate->graphics->getTextTracking() in the C API.",
        returns = "(number)",
        type = "method"
      },
      setLeading = {
        args = "(pixels: number))",
        description = "Sets the leading (spacing between lines) of this font, in pixels.\nEquivalent to playdate->graphics->setTextLeading() in the C API.",
        returns = "(fun(self: pd_font, pixels: number))",
        type = "method"
      },
      setTracking = {
        args = "(pixels: number))",
        description = "Sets the tracking of this font (spacing between letters), in pixels.\nEquivalent to playdate->graphics->setTextTracking() in the C API.",
        returns = "(fun(self: pd_font, pixels: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_font_variant = {
    type = "class"
  },
  pd_frameTimer = {
    childs = {
      delay = {
        description = "Number of frames to wait before starting the timer.",
        returns = "(number)",
        type = "value"
      },
      discardOnCompletion = {
        description = "If true, the timer is discarded once it is complete. Defaults to true.",
        returns = "(boolean)",
        type = "value"
      },
      duration = {
        description = "The number of frames for which the timer will run.",
        returns = "(number)",
        type = "value"
      },
      easingAmplitude = {
        description = "For easing functions in `CoreLibs/easing` that take additional amplitude and period arguments (such as `inOutElastic`), set these to desired values.",
        returns = "(number)",
        type = "value"
      },
      easingFunction = {
        args = "(fun(number, number, number, number",
        description = "The function used to calculate `value`. The function should be of the form `function(t, b, c, d)`, where `t` is elapsed time, `b` is the beginning value, `c` is the change (or `endValue - startValue`), and `d` is the duration.",
        returns = "(number))",
        type = "function"
      },
      easingPeriod = {
        description = "For easing functions in `CoreLibs/easing` that take additional amplitude and period arguments (such as `inOutElastic`), set these to desired values.",
        returns = "(number)",
        type = "value"
      },
      endValue = {
        description = "End value used when calculating `value`.",
        returns = "(number)",
        type = "value"
      },
      frame = {
        description = "The current frame.",
        returns = "(number)",
        type = "value"
      },
      pause = {
        args = "()",
        description = "Pauses a timer.",
        returns = "(fun(self: pd_frameTimer))",
        type = "method"
      },
      remove = {
        args = "()",
        description = "Removes this timer from the list of timers. This happens automatically when a non-repeating timer reaches it’s end, but you can use this method to dispose of timers manually.",
        returns = "(fun(self: pd_frameTimer))",
        type = "method"
      },
      repeats = {
        description = "If true, the timer starts over from the beginning when it completes. Defaults to false.",
        returns = "(boolean)",
        type = "value"
      },
      reset = {
        args = "()",
        description = "Resets a timer to its initial values.",
        returns = "(fun(self: pd_frameTimer))",
        type = "method"
      },
      reverseEasingFunction = {
        args = "(fun(number, number, number, number",
        description = "Set to provide an easing function to be used for the reverse portion of the timer. The function should be of the form `function(t, b, c, d)`, where `t` is elapsed time, `b` is the beginning value, `c` is the change (or `endValue - startValue`), and `d` is the duration.",
        returns = "(number))",
        type = "function"
      },
      reverses = {
        description = "If true, the timer plays in reverse once it has completed. The number of frames to complete both the forward and reverse will be `duration x 2`. Defaults to false.\nPlease note that the frame counter will restart at 0 and count up to `duration` again when the reverse timer starts, but `value` will be calculated in reverse, from `endValue` to `startValue`. The same easing function (as opposed to the inverse of the easing function) will be used for the reverse timer unless an alternate is provided by setting `reverseEasingFunction`.",
        returns = "(boolean)",
        type = "value"
      },
      start = {
        args = "()",
        description = "Resumes a timer. There is no need to call :start() on a newly-instantiated frame timer: frame timers start automatically.",
        returns = "(fun(self: pd_frameTimer))",
        type = "method"
      },
      startValue = {
        description = "Start value used when calculating `value`.",
        returns = "(number)",
        type = "value"
      },
      timerEndedArgs = {
        description = "For repeating timers, this function will be called each time the timer completes, before it starts again.\nAn array-style table of values that will be passed to the `timerEndedCallback` function.",
        returns = "(any[])",
        type = "value"
      },
      timerEndedCallback = {
        args = "nil | (fun())",
        description = 'A Function of the form `function(timer)` or `function(...)` where "..." corresponds to the values in the table assigned to `timerEndedArgs`. Called when the timer has completed.',
        returns = "(nil | (fun()))",
        type = "function"
      },
      updateCallback = {
        args = "nil | (fun())",
        description = "A function to be called on every frame update. If the frame timer was created with arguments, those will be passed as arguments to the function provided. Otherwise, the timer is passed as the single argument.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      value = {
        description = "Current value calculated from the start and end values, the current frame, and the easing function.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_graph = {
    childs = {
      addConnectionToNodeWithID = {
        args = "(fromNodeID: integer, toNodeID: integer, weight: number, addReciprocalConnection: boolean))",
        description = "Adds a connection from the node with id fromNodeID to the node with id toNodeID with a weight value of weight. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available. If addReciprocalConnection is true, the reverse connection will also be added.",
        returns = "(fun(self: pd_graph, fromNodeID: integer, toNodeID: integer, weight: number, addReciprocalConnection: boolean))",
        type = "method"
      },
      addConnections = {
        args = "(connections: number[][]))",
        description = "connections should be a table of array-style tables. The keys of the outer table should correspond to node IDs, while the inner array should be a series if connecting node ID and weight combinations that will be assigned to that node. For example, {[1]={2, 10, 3, 12}, [2]={1, 20}, [3]={1, 20, 2, 10}} will create a connection from node ID 1 to node ID 2 with a weight of 10, and a connection to node ID 3 with a weight of 12, and so on for the other entries.",
        returns = "(fun(self: pd_graph, connections: number[][]))",
        type = "method"
      },
      addNewNode = {
        args = "(id: integer, x?: number, y?: number, connectedNodes?: pd_node[], weights?: number[], addReciprocalConnections?: boolean))",
        description = "Creates a new playdate.pathfinder.node and adds it to the graph.\n`id`: id value for the new node.\n`x`: Optional x value for the node.\n`y`: Optional y value for the node.\n`connectedNodes`: Array of existing nodes to create connections to from the new node.\n`weights`: Array of weights for the new connections. Array must be the same length as `connectedNodes`. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.\n`addReciprocalConnections`: If true, connections will also be added in the reverse direction for each node.",
        returns = "(fun(self: pd_graph, id: integer, x?: number, y?: number, connectedNodes?: pd_node[], weights?: number[], addReciprocalConnections?: boolean | nil)",
        type = "method"
      },
      addNewNodes = {
        args = "(count: number)",
        description = "Creates `count` new nodes, adding them to the graph, and returns them in an array-style table. The new node’s `id_s will be assigned values 1 through _count`-1.\nThis method is useful to improve performance if many nodes need to be allocated at once rather than one at a time, for example when creating a new graph.",
        returns = "(pd_node[])",
        type = "method"
      },
      addNode = {
        args = "(node: pd_node, connectedNodes?: pd_node[], weights?: number[], addReciprocalConnections?: boolean))",
        description = "Adds an already-existing node to the graph. The node must have originally belonged to the same graph.\n`node`: Node to be added to the graph.\n`connectedNodes`: Array of existing nodes to create connections to from the new node.\n`weights`: Array of weights for the new connections. Array must be the same length as `connectedNodes`. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.\n`addReciprocalConnections`: If true, connections will also be added in the reverse direction for each connection added.",
        returns = "(fun(self: pd_graph, node: pd_node, connectedNodes?: pd_node[], weights?: number[], addReciprocalConnections?: boolean | nil)",
        type = "method"
      },
      addNodes = {
        args = "(nodes: pd_node[]))",
        description = "Adds an array of already-existing nodes to the graph.",
        returns = "(fun(self: pd_graph, nodes: pd_node[]))",
        type = "method"
      },
      allNodes = {
        args = "()",
        description = "Returns an array containing all nodes in the graph.",
        returns = "(pd_node[])",
        type = "method"
      },
      findPath = {
        args = "(startNode: pd_node, goalNode: pd_node, heuristicFunction?: nil | (fun(pd_node, pd_node): number), findPathToGoalAdjacentNodes?: boolean)",
        description = "Returns an array of nodes representing the path from `startNode` to `goalNode`, or `nil` if no path can be found.\n`heuristicFunction`: If provided, this function should be of the form `function(startNode, goalNode)` and should return an integer value estimate or underestimate of the distance from `startNode` to `goalNode`. If not provided, a manhattan distance function will be used to calculate the estimate. This requires that the `x, y` values of the nodes in the graph have been set properly.\n`findPathToGoalAdjacentNodes`: If true, a path will be found to any node adjacent to the goal node, based on the `x, y` values of those nodes and the goal node. This does not rely on connections between adjacent nodes and the goal node, which can be entirely disconnected from the rest of the graph.",
        returns = "(pd_node[] | nil)",
        type = "method"
      },
      findPathWithIDs = {
        args = "(startNodeID: integer, goalNodeID: integer, heuristicFunction?: nil | (fun(pd_node, pd_node): number), findPathToGoalAdjacentNodes?: boolean)",
        description = "Works the same as findPath, but looks up nodes to find a path between using startNodeID and goalNodeID and returns a list of nodeIDs rather than the nodes themselves.",
        returns = "(integer[] | nil)",
        type = "method"
      },
      nodeWithID = {
        args = "(id: integer)",
        description = "Returns the first node found in the graph with a matching `id`, or nil if no such node is found.",
        returns = "(pd_node | nil)",
        type = "method"
      },
      nodeWithXY = {
        args = "(x: number, y: number)",
        description = "Returns the first node found in the graph with matching `x` and `y` values, or nil if no such node is found.",
        returns = "(pd_node | nil)",
        type = "method"
      },
      removeAllConnections = {
        args = "()",
        description = "Removes all connections from all nodes in the graph.",
        returns = "(fun(self: pd_graph))",
        type = "method"
      },
      removeAllConnectionsFromNodeWithID = {
        args = "(id: integer, removeIncoming?: boolean))",
        description = "Removes all connections from the matching node.\nIf removeIncoming is true, all connections from other nodes to the calling node are also removed. False by default. Please note: this can signficantly increase the time this function takes as it requires a full search of the graph - O(1) vs O(n)).",
        returns = "(fun(self: pd_graph, id: integer, removeIncoming?: boolean | nil)",
        type = "method"
      },
      removeNode = {
        args = "(node: pd_node))",
        description = "Removes node from the graph. Also removes all connections to and from the node.",
        returns = "(fun(self: pd_graph, node: pd_node))",
        type = "method"
      },
      removeNodeWithID = {
        args = "(id: integer)",
        description = "Returns the first node found with a matching `id`, after removing it from the graph and removing all connections to and from the node.",
        returns = "(pd_node)",
        type = "method"
      },
      removeNodeWithXY = {
        args = "(x: number, y: number)",
        description = "Returns the first node found with coordinates matching `x, y`, after removing it from the graph and removing all connections to and from the node.",
        returns = "(pd_node)",
        type = "method"
      },
      setXYForNodeWithID = {
        args = "(id: integer, x: number, y: number))",
        description = "Sets the matching node’s x and y values.",
        returns = "(fun(self: pd_graph, id: integer, x: number, y: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_gridview = {
    childs = {
      addHorizontalDividerAbove = {
        args = "(section: integer, row: number))",
        description = "Causes a horizontal divider to be drawn above the specified row. Drawing can be customized by overriding playdate.ui.gridview:drawHorizontalDivider.",
        returns = "(fun(self: pd_gridview, section: integer, row: number))",
        type = "method"
      },
      backgroundImage = {
        description = "A background image that draws behind the gridview’s cells. This image can be either a playdate.graphics.image which will be tiled or a playdate.nineSlice.",
        returns = "(pd_image)",
        type = "value"
      },
      changeRowOnColumnWrap = {
        description = "Controls the behavior of playdate.ui.gridview:selectPreviousColumn() and playdate.ui.gridview:selectNextColumn() if the current selection is at the first or last column, respectively. If set to true, the selection switch to a new row to allow the selection to change. If false, the call will have no effect on the selection. True by default.",
        returns = "(boolean)",
        type = "value"
      },
      drawCell = {
        args = "(section: integer, row: number, column: number, selected: boolean, x: number, y: number, width: number, height: number))",
        description = "Override this method to draw the cells in the gridview. `selected` is a boolean, true if the cell being drawn is the currently-selected cell.",
        returns = "(fun(self: pd_gridview, section: integer, row: number, column: number, selected: boolean, x: number, y: number, width: number, height: number))",
        type = "method"
      },
      drawHorizontalDivider = {
        args = "(x: number, y: number, width: number, height: number))",
        description = "Override this method to customize the drawing of horizontal dividers. This function will only be called if the horizontal divider height is greater than zero (0) and at least one divider has been added.",
        returns = "(fun(self: pd_gridview, x: number, y: number, width: number, height: number))",
        type = "method"
      },
      drawInRect = {
        args = "(x: number, y: number, width: number, height: number))",
        description = "Draws the gridview in the specified rect. Ideally this should be called on every playdate.update() to accommodate scrolling.",
        returns = "(fun(self: pd_gridview, x: number, y: number, width: number, height: number))",
        type = "method"
      },
      drawSectionHeader = {
        args = "(section: integer, x: number, y: number, width: number, height: number))",
        description = "Override this method to draw section headers. This function will only be called if the header height has been set to a value greater than zero (0).",
        returns = "(fun(self: pd_gridview, section: integer, x: number, y: number, width: number, height: number))",
        type = "method"
      },
      easingAmplitude = {
        description = "For easing functions that take additional amplitude and period arguments (such as `inOutElastic`), set these to the desired values.",
        returns = "(number)",
        type = "value"
      },
      easingPeriod = {
        description = "For easing functions that take additional amplitude and period arguments (such as `inOutElastic`), set these to the desired values.",
        returns = "(number)",
        type = "value"
      },
      getCellBounds = {
        args = "(section: integer, row: number, column: number, gridWidth?: number)",
        description = "Returns multiple values (x, y, width, height) representing the bounds of the cell, not including padding, relative to the top-right corner of the grid view.\nIf the grid view is configured with zero width cells (see playdate.ui.gridview:new), `gridWidth` is required, and should be the same value you would pass to playdate.ui.gridview:drawInRect.",
        returns = "((number, number, number, number))",
        type = "method"
      },
      getHorizontalDividerHeight = {
        args = "()",
        description = "Returns the height of the horizontal dividers.",
        returns = "(number)",
        type = "method"
      },
      getNumberOfColumns = {
        args = "()",
        description = "Returns the number of columns in the gridview. 1 by default.",
        returns = "(number)",
        type = "method"
      },
      getNumberOfRowsInSection = {
        args = "(section: integer)",
        description = "Returns the number of rows in `section`.",
        returns = "(number)",
        type = "method"
      },
      getNumberOfSections = {
        args = "()",
        description = "Returns the number of sections in the grid view.",
        returns = "(number)",
        type = "method"
      },
      getScrollPosition = {
        args = "()",
        description = "Returns the current scroll location as a pair `x`, `y`.",
        returns = "((number, number))",
        type = "method"
      },
      getSectionHeaderHeight = {
        args = "()",
        description = "Returns the current height of the section headers.",
        returns = "(number)",
        type = "function"
      },
      getSelectedRow = {
        args = "()",
        description = "Convenience method for list-style gridviews. Returns the selected cell at `row` in section 1.",
        returns = "(integer)",
        type = "method"
      },
      getSelection = {
        args = "()",
        description = "Returns the currently-selected cell as `section`, `row`, `column`",
        returns = "((integer, integer, integer))",
        type = "method"
      },
      isScrolling = {
        description = "Read-only. True if the gridview is currently performing a scroll animation.",
        returns = "(READONLY_boolean)",
        type = "value"
      },
      needsDisplay = {
        description = "This read-only variable returns true if the gridview needs to be redrawn. This can be used to help optimize drawing in your app. Keep in mind that a gridview cannot know all reasons it may need to be redrawn, such as changes in your drawing callback functions, coordinate or size changes, or overlapping drawing, so you may need to additionally redraw at other times.",
        returns = "(READONLY_boolean)",
        type = "value"
      },
      removeHorizontalDividers = {
        args = "()",
        description = "Removes all horizontal dividers from the grid view.",
        returns = "(fun(self: pd_gridview))",
        type = "method"
      },
      scrollCellToCenter = {
        args = "(section: integer, row: number, column: number, animated?: boolean))",
        description = "Scrolls to the specified cell, so the cell is centered in the gridview, if possible.",
        returns = "(fun(self: pd_gridview, section: integer, row: number, column: number, animated?: boolean | nil)",
        type = "method"
      },
      scrollCellsToCenter = {
        description = "If true, the gridview will attempt to center cells when scrolling. If false, the gridview will be scrolled just as much as necessary to make the cell visible.",
        returns = "(boolean)",
        type = "value"
      },
      scrollEasingFunction = {
        args = "(fun(number, number, number, number",
        description = "The easing function used when performing scroll animations. The function should be of the form function(t, b, c, d), where t is elapsed time, b is the beginning value, c is the change, or end value - start value, and d is the duration. Many such functions are available in playdate.easingFunctions. playdate.easingFunctions.outCubic is the default.",
        returns = "(number))",
        type = "function"
      },
      scrollToCell = {
        args = "(section: integer, row: number, column: number, animated?: boolean))",
        description = "Scrolls to the specified cell, just enough so the cell is visible.",
        returns = "(fun(self: pd_gridview, section: integer, row: number, column: number, animated?: boolean | nil)",
        type = "method"
      },
      scrollToRow = {
        args = "(row: number, animated?: boolean))",
        description = "Convenience function for list-style gridviews. Scrolls to the specified row in the list.",
        returns = "(fun(self: pd_gridview, row: number, animated?: boolean | nil)",
        type = "method"
      },
      scrollToTop = {
        args = "(animated?: boolean))",
        description = "Scrolls to the top of the gridview.",
        returns = "(fun(self: pd_gridview, animated?: boolean | nil)",
        type = "method"
      },
      selectNextColumn = {
        args = "(wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean))",
        description = "Selects the cell directly to the right of the currently-selected cell.\nIf the last column is currently selected and `wrapSelection` is true, the selection will wrap around to the opposite side of the grid. If a wrap occurs and the gridview’s changeRowOnColumnWrap is true the row will also be advanced or moved back.\nIf `scrollToSelection` is true (or not provided), the newly-selected cell will be scrolled to. If `animate` is true (or not provided), the scroll will be animated.",
        returns = "(fun(self: pd_gridview, wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean | nil)",
        type = "method"
      },
      selectNextRow = {
        args = "(wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean))",
        description = "Selects the cell directly below the currently-selected cell.\nIf `wrapSelection` is true, the selection will wrap around to the opposite end of the grid. If `scrollToSelection` is true (or not provided), the newly-selected cell will be scrolled to. If `animate` is true (or not provided), the scroll will be animated.",
        returns = "(fun(self: pd_gridview, wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean | nil)",
        type = "method"
      },
      selectPreviousColumn = {
        args = "(wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean))",
        description = "Identical to selectNextColumn() but goes the other direction.",
        returns = "(fun(self: pd_gridview, wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean | nil)",
        type = "method"
      },
      selectPreviousRow = {
        args = "(wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean))",
        description = "Identical to selectNextRow() but goes the other direction.",
        returns = "(fun(self: pd_gridview, wrapSelection: boolean, scrollToSelection?: boolean, animate?: boolean | nil)",
        type = "method"
      },
      setCellPadding = {
        args = "(left: number, right: number, top: number, bottom: number))",
        description = "Sets the amount of padding around cells.",
        returns = "(fun(self: pd_gridview, left: number, right: number, top: number, bottom: number))",
        type = "method"
      },
      setCellSize = {
        args = "(cellWidth: number, cellHeight: number))",
        description = "Sets the size of the cells in the gridview. If cells should span the entire width of the grid (as in a list view), pass zero (0) for `cellWidth`.",
        returns = "(fun(self: pd_gridview, cellWidth: number, cellHeight: number))",
        type = "method"
      },
      setContentInset = {
        args = "(left: number, right: number, top: number, bottom: number))",
        description = "Sets the amount of space the content is inset from the edges of the gridview. Useful if a background image is being used as a border.",
        returns = "(fun(self: pd_gridview, left: number, right: number, top: number, bottom: number))",
        type = "method"
      },
      setHorizontalDividerHeight = {
        args = "(height: number))",
        description = "Sets the height of the horizontal dividers. The default height is half the cell height specified when creating the grid view.",
        returns = "(fun(self: pd_gridview, height: number))",
        type = "method"
      },
      setNumberOfColumns = {
        args = "(num: integer))",
        description = "Sets the number of columns in the gridview. 1 by default.",
        returns = "(fun(self: pd_gridview, num: integer))",
        type = "method"
      },
      setNumberOfRows = {
        args = "(count1: integer, ...: integer))",
        description = "Convenience method for list-style gridviews, or for setting the number of rows for multiple sections at a time. Pass in a list of numbers of rows for sections starting from section 1.",
        returns = "(fun(self: pd_gridview, count1: integer, ...: integer))",
        type = "method"
      },
      setNumberOfRowsInSection = {
        args = "(section: integer, num: integer))",
        description = "Sets the number of rows in `section`.",
        returns = "(fun(self: pd_gridview, section: integer, num: integer))",
        type = "method"
      },
      setNumberOfSections = {
        args = "(num: integer))",
        description = "Sets the number of sections in the grid view. Each section contains at least one row, and row numbering starts at 1 in each section.",
        returns = "(fun(self: pd_gridview, num: integer))",
        type = "method"
      },
      setScrollDuration = {
        args = "(ms: number))",
        description = "Controls the duration of scroll animations. 250ms by default.",
        returns = "(fun(self: pd_gridview, ms: number))",
        type = "method"
      },
      setScrollPosition = {
        args = "(x: number, y: number, animated?: boolean))",
        description = "'set' scrolls to the coordinate `x`, `y`.\nIf `animated` is true (or not provided) the new scroll position is animated to using playdate.ui.gridview.scrollEasingFunction and the value set in playdate.ui.gridview:setScrollDuration().",
        returns = "(fun(self: pd_gridview, x: number, y: number, animated?: boolean | nil)",
        type = "method"
      },
      setSectionHeaderHeight = {
        args = "(height: number))",
        description = "Sets the height of the section headers. 0 by default, which causes section headers not to be drawn.",
        returns = "(fun(self: pd_gridview, height: number))",
        type = "method"
      },
      setSectionHeaderPadding = {
        args = "(left: number, right: number, top: number, bottom: number))",
        description = "Sets the amount of padding around section headers.",
        returns = "(fun(self: pd_gridview, left: number, right: number, top: number, bottom: number))",
        type = "method"
      },
      setSelectedRow = {
        args = "(row: number))",
        description = "Convenience method for list-style gridviews. Selects the cell at `row` in section 1.",
        returns = "(fun(self: pd_gridview, row: number))",
        type = "method"
      },
      setSelection = {
        args = "(section: integer, row: number, column: number))",
        description = "Selects the cell at the given position.",
        returns = "(fun(self: pd_gridview, section: integer, row: number, column: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_image = {
    childs = {
      addMask = {
        args = "(opaque?: boolean))",
        description = "Adds a mask to the image if it doesn’t already have one. If `opaque` is true or not specified, the image mask applied will be completely white, so the image will be entirely opaque. If `opaque` is false, the mask will be completely black, so the image will be entirely transparent.",
        returns = "(fun(self: pd_image, opaque?: boolean | nil)",
        type = "method"
      },
      blendWithImage = {
        args = "(image: pd_image, alpha: number, ditherType: pd_dither_type)",
        description = "Returns an image that is a blend between the caller and `image`.\n`image`: the playdate.graphics.image to be blended with the caller.\n`alpha`: The alpha value assigned to the caller. `image` will have an alpha of (1 - `alpha`).\n`ditherType`: The caller and `image` are blended into a greyscale image and dithered with one of the dithering algorithms listed in playdate.graphics.image:blurredImage()",
        returns = "(pd_image)",
        type = "method"
      },
      blurredImage = {
        args = "(radius: number, numPasses: number, ditherType: pd_dither_type, padEdges?: boolean, xPhase?: number, yPhase?: number)",
        description = "Returns a blurred copy of the caller.\n`radius`: A bigger radius means a more blurred result. Processing time is independent of the radius.\n`numPasses`: A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.\n`ditherType`: The original image is blurred into a greyscale image then dithered back to 1-bit using one of the following dithering algorithms:\n`playdate.graphics.image.kDitherTypeNone`\n`playdate.graphics.image.kDitherTypeDiagonalLine`\n`playdate.graphics.image.kDitherTypeVerticalLine`\n`playdate.graphics.image.kDitherTypeHorizontalLine`\n`playdate.graphics.image.kDitherTypeScreen`\n`playdate.graphics.image.kDitherTypeBayer2x2`\n`playdate.graphics.image.kDitherTypeBayer4x4`\n`playdate.graphics.image.kDitherTypeBayer8x8`\n`playdate.graphics.image.kDitherTypeFloydSteinberg`\n`playdate.graphics.image.kDitherTypeBurkes`\n`playdate.graphics.image.kDitherTypeAtkinson`\n`padEdges`: Boolean indicating whether the edges of the images should be padded to accommodate the blur radius. Defaults to false.\n`xPhase`, `yPhase`: optional; integer values that affect the appearance of `playdate.graphics.image.kDitherTypeDiagonalLine`, `playdate.graphics.image.kDitherTypeVerticalLine`, `playdate.graphics.image.kDitherTypeHorizontalLine`, `playdate.graphics.image.kDitherTypeScreen`, `playdate.graphics.image.kDitherTypeBayer2x2`, `playdate.graphics.image.kDitherTypeBayer4x4`, and `playdate.graphics.image.kDitherTypeBayer8x8`.",
        returns = "(pd_image)",
        type = "method"
      },
      clear = {
        args = "(color: pd_color))",
        description = "Erases the contents of the image, setting all pixels to white if `color` is `playdate.graphics.kColorWhite`, black if it’s `playdate.graphics.kColorBlack`, or clear if it’s `playdate.graphics.kColorClear`. If the image is cleared to black or white, the mask (if it exists) is set to fully opaque. If the image is cleared to kColorClear and the image doesn’t have a mask, a mask is added to it.",
        returns = "(fun(self: pd_image, color: pd_color))",
        type = "method"
      },
      clearMask = {
        args = "(opaque?: boolean))",
        description = "Erases the contents of the image’s mask, so that the image is entirely opaque if `opaque` is 1, transparent otherwise. This function has no effect if the image doesn’t have a mask.",
        returns = "(fun(self: pd_image, opaque?: boolean | nil)",
        type = "method"
      },
      copy = {
        args = "()",
        description = "Returns a new playdate.graphics.image that is an exact copy of the original.",
        returns = "(pd_image)",
        type = "method"
      },
      draw = {
        args = "(fun(self: pd_image, x: number, y: number, flip?: pd_image_flip, sourceRect?: pd_rect)) | (fun(self: pd_image, p: pd_point, flip?: pd_image_flip, sourceRect?: pd_rect)) | (fun(self: pd_image, x: number, y: number, flip?: pd_image_flip, rx?: number, ry?: number, rw?: number, rh?: number)) | (fun(self: pd_image, p: pd_point, flip?: pd_image_flip, rx?: number, ry?: number, rw?: number, rh?: number))",
        description = 'Draws the image with its upper-left corner at location (`x`, `y`) or playdate.geometry.point `p`.\nThe optional `flip` argument can be one of the following:\n`playdate.graphics.kImageUnflipped`: the image is drawn normally\n`playdate.graphics.kImageFlippedX`: the image is flipped left to right\n`playdate.graphics.kImageFlippedY`: the image is flipped top to bottom\n`playdate.graphics.kImageFlippedXY`: the image if flipped both ways; i.e., rotated 180 degrees\nAlternately, one of the strings "flipX", "flipY", or "flipXY" can be used for the `flip` argument.\n`sourceRect`, if specified, will cause only the part of the image within sourceRect to be drawn. `sourceRect` should be relative to the image’s bounds and can be a playdate.geometry.rect or four integers, (`x`, `y`, `w`, `h`), representing the rect.',
        returns = "((fun(self: pd_image, x: number, y: number, flip?: pd_image_flip, sourceRect?: pd_rect)) | (fun(self: pd_image, p: pd_point, flip?: pd_image_flip, sourceRect?: pd_rect)) | (fun(self: pd_image, x: number, y: number, flip?: pd_image_flip, rx?: number, ry?: number, rw?: number, rh?: number)) | (fun(self: pd_image, p: pd_point, flip?: pd_image_flip, rx?: number, ry?: number, rw?: number, rh?: number) | nil)",
        type = "function"
      },
      drawAnchored = {
        args = "(x: number, y: number, ax: number, ay: number, flip?: pd_image_flip))",
        description = "Draws the image at location `(x, y)` centered at the point within the image represented by `(ax, ay)` in unit coordinate space. For example, values of `ax = 0.0`, `ay = 0.0` represent the image’s top-left corner, `ax = 1.0`, `ay = 1.0` represent the bottom-right, and `ax = 0.5`, `ay = 0.5` represent the center of the image.\nThe `flip` argument is optional; see playdate.graphics.image:draw() for valid values.\nYou must import `CoreLibs/graphics` to use this method.",
        returns = "(fun(self: pd_image, x: number, y: number, ax: number, ay: number, flip?: pd_image_flip | nil)",
        type = "method"
      },
      drawBlurred = {
        args = "(x: number, y: number, radius: number, numPasses: number, ditherType: pd_dither_type, flip?: pd_image_flip, xPhase?: number, yPhase?: number))",
        description = "Draws a blurred version of the image at (`x`, `y`).\n`radius`: A bigger radius means a more blurred result. Processing time is independent of the radius.\n`numPasses`: A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.\n`ditherType`: The algorithm to use when blurring the image, must be one of the values listed in playdate.graphics.image:blurredImage()\n`flip`: optional; see playdate.graphics.image:draw() for valid values.\n`xPhase`, `yPhase`: optional; integer values that affect the appearance of `playdate.graphics.image.kDitherTypeDiagonalLine`, `playdate.graphics.image.kDitherTypeVerticalLine`, `playdate.graphics.image.kDitherTypeHorizontalLine`, `playdate.graphics.image.kDitherTypeScreen`, `playdate.graphics.image.kDitherTypeBayer2x2`, `playdate.graphics.image.kDitherTypeBayer4x4`, and `playdate.graphics.image.kDitherTypeBayer8x8`.",
        returns = "(fun(self: pd_image, x: number, y: number, radius: number, numPasses: number, ditherType: pd_dither_type, flip?: pd_image_flip, xPhase?: number, yPhase?: number | nil)",
        type = "method"
      },
      drawCentered = {
        args = "(x: number, y: number, flip?: pd_image_flip))",
        description = "Draws the image centered at location `(x, y)`.\nThe `flip` argument is optional; see playdate.graphics.image:draw() for valid values.\nYou must import `CoreLibs/graphics` to use this method.",
        returns = "(fun(self: pd_image, x: number, y: number, flip?: pd_image_flip | nil)",
        type = "method"
      },
      drawFaded = {
        args = "(x: number, y: number, alpha: number, ditherType: pd_dither_type))",
        description = "Draws a partially transparent image with its upper-left corner at location (`x`, `y`)\n`alpha`: The alpha value used to draw the image, with 1 being fully opaque, and 0 being completely transparent.\n`ditherType`: The caller is faded using one of the dithering algorithms listed in playdate.graphics.image:blurredImage()",
        returns = "(fun(self: pd_image, x: number, y: number, alpha: number, ditherType: pd_dither_type))",
        type = "method"
      },
      drawIgnoringOffset = {
        args = "(fun(self: pd_image, x: number, y: number, flip?: pd_image_flip)) | (fun(self: pd_image, p: pd_point, flip?: pd_image_flip))",
        description = "Draws the image ignoring the currently-set drawOffset.",
        returns = "((fun(self: pd_image, x: number, y: number, flip?: pd_image_flip)) | (fun(self: pd_image, p: pd_point, flip?: pd_image_flip) | nil)",
        type = "function"
      },
      drawRotated = {
        args = "(x: number, y: number, angle: number, scale?: number, yscale?: number))",
        description = "Draws this image centered at point `(x,y)` at (clockwise) `angle` degrees, scaled by optional argument `scale`, with an optional separate scaling for the y axis.",
        returns = "(fun(self: pd_image, x: number, y: number, angle: number, scale?: number, yscale?: number | nil)",
        type = "method"
      },
      drawSampled = {
        args = "(x: number, y: number, width: number, height: number, centerx: number, centery: number, dxx: number, dyx: number, dxy: number, dyy: number, dx: number, dy: number, z: number, tiltAngle: number, tile: boolean))",
        description = "Draws the image as if it’s mapped onto a tilted plane, transforming the target coordinates to image coordinates using an affine transform:\nx' = dxx * x + dyx * y + dx\ny' = dxy * x + dyy * y + dy\n`x, y, width, height`: The rectangle to fill\n`centerx, centery`: The point in the above rectangle [in (0,1)x(0,1) coordinates] for the center of the transform\n`dxx, dyx, dxy, dyy, dx, dy`: Defines an affine transform from geometry coordinates to image coordinates\n`z`: The distance from the viewer to the target plane — lower z means more exaggerated perspective\n`tiltAngle`: The tilt of the target plane about the x axis, in degrees\n`tile`: A boolean, indicating whether the image is tiled on the target plane\nThe `Mode7Driver` demo in the `/Examples` folder of the SDK demonstrates the usage of this function.",
        returns = "(fun(self: pd_image, x: number, y: number, width: number, height: number, centerx: number, centery: number, dxx: number, dyx: number, dxy: number, dyy: number, dx: number, dy: number, z: number, tiltAngle: number, tile: boolean))",
        type = "method"
      },
      drawScaled = {
        args = "(x: number, y: number, scale: number, yscale?: number))",
        description = "Draws this image with its upper-left corner at point `(x,y)`, scaled by amount `scale`, with an optional separate scaling for the y axis.",
        returns = "(fun(self: pd_image, x: number, y: number, scale: number, yscale?: number | nil)",
        type = "method"
      },
      drawTiled = {
        args = "(fun(self: pd_image, x: number, y: number, width: number, height: number, flip?: pd_image_flip)) | (fun(self: pd_image, rect: pd_rect, flip?: pd_image_flip))",
        description = "Tiles the image into the given rectangle, using either listed dimensions or a playdate.geometry.rect object, and the optional flip style.",
        returns = "((fun(self: pd_image, x: number, y: number, width: number, height: number, flip?: pd_image_flip)) | (fun(self: pd_image, rect: pd_rect, flip?: pd_image_flip) | nil)",
        type = "function"
      },
      drawWithTransform = {
        args = "(xform: pd_affineTransform, x: number, y: number))",
        description = "Draws this image centered at point `(x,y)` with the transform `xform` applied.",
        returns = "(fun(self: pd_image, xform: pd_affineTransform, x: number, y: number))",
        type = "method"
      },
      fadedImage = {
        args = "(alpha: number, ditherType: pd_dither_type)",
        description = "Returns a faded version of the caller.\n`alpha`: The alpha value assigned to the caller, in the range 0.0 - 1.0. If an image mask already exists it is multiplied by `alpha`.\n`ditherType`: The caller is faded into a greyscale image and dithered with one of the dithering algorithms listed in playdate.graphics.image:blurredImage()",
        returns = "(pd_image)",
        type = "method"
      },
      getMaskImage = {
        args = "()",
        description = "If the image has a mask, returns the mask as a separate image. Otherwise, returns nil.\nThe returned image references the original’s data, so drawing into this image alters the original image’s mask.",
        returns = "(pd_image)",
        type = "method"
      },
      getSize = {
        args = "()",
        description = "Returns the pair (`width`, `height`)",
        returns = "((number, number))",
        type = "method"
      },
      hasMask = {
        args = "()",
        description = "Returns `true` if the image has a mask.",
        returns = "(boolean)",
        type = "method"
      },
      invertedImage = {
        args = "()",
        description = "Returns a color-inverted copy of the caller.",
        returns = "(pd_image)",
        type = "method"
      },
      load = {
        args = "(path: string)",
        description = "Loads a new image from the data at `path` into an already-existing image, without allocating additional memory. The image at `path` must be of the same dimensions as the original.\nReturns `(success, [error])`. If the boolean `success` is false, `error` is also returned.",
        returns = "((boolean, string? | nil)",
        type = "method"
      },
      removeMask = {
        args = "()",
        description = "Removes the mask from the image if it has one.",
        returns = "(fun(self: pd_image))",
        type = "method"
      },
      rotatedImage = {
        args = "(angle: number, scale?: number, yscale?: number)",
        description = "Returns a new image containing this image rotated by (clockwise) `angle` degrees, scaled by optional argument `scale`, with an optional separate scaling for the y axis.\nUnless rotating by a multiple of 180 degrees, the new image will have different dimensions than the original.",
        returns = "(pd_image)",
        type = "method"
      },
      sample = {
        args = "(x: number, y: number)",
        description = "Returns `playdate.graphics.kColorWhite` if the image is white at (`x`, `y`), `playdate.graphics.kColorBlack` if it’s black, or `playdate.graphics.kColorClear` if it’s transparent.\nThe upper-left pixel of the image is at coordinate `(0, 0)`.",
        returns = "(pd_color)",
        type = "method"
      },
      scaledImage = {
        args = "(scale: number, yscale?: number)",
        description = "Returns a new image containing this image scaled by amount `scale`, with an optional separate scaling for the y axis.",
        returns = "(pd_image)",
        type = "method"
      },
      setInverted = {
        args = "(flag: boolean))",
        description = "If `flag` is true, the image will be drawn with its colors inverted. If the image is being used as a stencil, its behavior is reversed: pixels are drawn where the stencil is black, nothing is drawn where the stencil is white.",
        returns = "(fun(self: pd_image, flag: boolean))",
        type = "method"
      },
      setMaskImage = {
        args = "(maskImage: pd_image))",
        description = "Sets the image’s mask to a copy of `maskImage`.",
        returns = "(fun(self: pd_image, maskImage: pd_image))",
        type = "method"
      },
      transformedImage = {
        args = "(xform: pd_affineTransform)",
        description = "Returns a new image containing the image with the transform `xform` applied.",
        returns = "(pd_image)",
        type = "method"
      },
      vcrPauseFilterImage = {
        args = "()",
        description = "Returns an image created by applying a VCR pause effect to the calling image.",
        returns = "(pd_image)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_image_flip = {
    type = "class"
  },
  pd_imagetable = {
    childs = {
      drawImage = {
        args = "(n: integer, x: number, y: number, flip?: pd_image_flip))",
        description = "Equivalent to graphics.imagetable:getImage(n):draw(x,y,[flip]).",
        returns = "(fun(self: pd_imagetable, n: integer, x: number, y: number, flip?: pd_image_flip | nil)",
        type = "method"
      },
      getImage = {
        args = "(fun(self: pd_imagetable, n: integer): pd_image) | (fun(self: pd_imagetable, x: number, y: number",
        description = "### Overload 1 ###\nReturns the `n`-th playdate.graphics.image in the table (ordering left-to-right, top-to-bottom). The first image is at index 1. If .n_ or (`x`,`y`) is out of bounds, the function returns nil. See also imagetable[n].\n### Overload 2 ###\nReturns the image in cell (`x`,`y`) in the original bitmap. The first image is at index 1. If `n` or (`x`,`y`) is out of bounds, the function returns nil. See also imagetable[n].",
        returns = "(pd_image))",
        type = "function"
      },
      getLength = {
        args = "()",
        description = "Returns the number of images in the table. See also #imagetable.",
        returns = "(number)",
        type = "method"
      },
      getSize = {
        args = "()",
        description = "Returns the pair (`cellsWide`, `cellsHigh`).",
        returns = "((number, number))",
        type = "method"
      },
      load = {
        args = "(path: string)",
        description = "Loads a new image table from the data at `path` into an already-existing image table, without allocating additional memory. The image table at `path` must contain images of the same dimensions as the previous.\nReturns (success, [error]). If the boolean success is false, error is also returned.",
        returns = "((boolean, string? | nil)",
        type = "method"
      },
      setImage = {
        args = "(n: integer, image: pd_image))",
        description = "Sets the image at slot `n` in the image table by creating a reference to the data in `image`.",
        returns = "(fun(self: pd_imagetable, n: integer, image: pd_image))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_input_handler = {
    childs = {
      AButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the A Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      AButtonHeld = {
        args = "nil | (fun())",
        description = "Called after the A Button is held down for one second. This can be used for secondary actions (e.g., displaying a game world map, changing weapons).",
        returns = "(nil | (fun()))",
        type = "function"
      },
      AButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the A Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      BButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the B Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      BButtonHeld = {
        args = "nil | (fun())",
        description = "Called after the B Button is held down for one second. This can be used for secondary actions (e.g., displaying a game world map, changing weapons).",
        returns = "(nil | (fun()))",
        type = "function"
      },
      BButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the B Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      cranked = {
        args = "nil | (fun(change: number, acceleratedChange: number))",
        description = "For playdate.cranked(), `change` is the angle change in degrees. `acceleratedChange` is `change` multiplied by a value that increases as the crank moves faster, similar to the way mouse acceleration works. Negative values are anti-clockwise.",
        returns = "(nil | (fun(change: number, acceleratedChange: number)))",
        type = "function"
      },
      downButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the down direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      downButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the down direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      leftButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the left direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      leftButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the left direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      rightButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the right direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      rightButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the right direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      upButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the up direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      upButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the up direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      }
    },
    type = "class"
  },
  pd_instrument = {
    childs = {
      addVoice = {
        args = "(v: pd_synth, note?: string|number, rangeend?: string|number, transpose?: number))",
        description = 'Adds the given playdate.sound.synth to the instrument. If only the `note` argument is given, the voice is only used for that note, and is transposed to play at normal speed (i.e. rate=1.0 for samples, or C4 for synths). If `rangeend` is given, the voice is assigned to the range `note` to `rangeend`, inclusive, with the first note in the range transposed to rate=1.0/C4. The note and rangeend arguments can be MIDI note numbers or note names like "Db3". The final transpose argument transposes the note played, in half-tone units.',
        returns = "(fun(self: pd_instrument, v: pd_synth, note?: string|number, rangeend?: string|number, transpose?: number | nil)",
        type = "method"
      },
      allNotesOff = {
        args = "()",
        description = "Sends a stop signal to all playing notes.",
        returns = "(fun(self: pd_instrument))",
        type = "method"
      },
      getVolume = {
        args = "()",
        description = "Returns the current volume for the synth, a single value for mono sources or a pair of values (left, right) for stereo sources.\nVolume values are between 0.0 and 1.0.",
        returns = "(number)",
        type = "method"
      },
      noteOff = {
        args = "(note: string|number, when?: number))",
        description = "Stops the instrument voice playing note `note`. If `when` is given, the note is stopped `when` seconds in the future, otherwise it’s stopped immediately.",
        returns = "(fun(self: pd_instrument, note: string|number, when?: number | nil)",
        type = "method"
      },
      playMIDINote = {
        args = "(note: string|number, vel?: number, length?: number, when?: number))",
        description = "Identical to instrument:playNote() but `note` is a MIDI note number: 60=C4, 61=C#4, etc. Fractional values are allowed.",
        returns = "(fun(self: pd_instrument, note: string|number, vel?: number, length?: number, when?: number | nil)",
        type = "method"
      },
      playNote = {
        args = "(frequency: number, vel?: number, length?: number, when?: number))",
        description = "Plays the given note on the instrument. A string like Db3 can be used instead of a pitch/note number. Fractional values are allowed. `vel` defaults to 1.0, fully on. If `length` isn’t specified, the note stays on until `instrument.noteOff(note)` is called. `when` is the number of seconds in the future to start playing the note, default is immediately.",
        returns = "(fun(self: pd_instrument, frequency: number, vel?: number, length?: number, when?: number | nil)",
        type = "method"
      },
      setPitchBend = {
        args = "(amount: number))",
        description = "Sets the pitch bend to be applied to the voices in the instrument, as a fraction of the full range.",
        returns = "(fun(self: pd_instrument, amount: number))",
        type = "method"
      },
      setPitchBendRange = {
        args = "(halfsteps: number))",
        description = "Sets the pitch bend range for the voices in the instrument. The default range is 12, for a full octave.",
        returns = "(fun(self: pd_instrument, halfsteps: number))",
        type = "method"
      },
      setTranspose = {
        args = "(halfsteps: number))",
        description = "Transposes all voices in the instrument. `halfsteps` can be a fractional value.",
        returns = "(fun(self: pd_instrument, halfsteps: number))",
        type = "method"
      },
      setVolume = {
        args = "(left: number, right?: number))",
        description = "Sets the instrument volume. If a single value is passed in, sets both left side and right side volume to the given value. If two values are given, volumes are set separately.\nVolume values are between 0.0 and 1.0.",
        returns = "(fun(self: pd_instrument, left: number, right?: number | nil)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_item = {
    childs = {
      getTitle = {
        args = "()",
        description = "Returns the title displayed for this menu item.",
        returns = "(string)",
        type = "method"
      },
      getValue = {
        args = "()",
        description = "Returns the value for this menu item.",
        returns = "(integer|boolean|string)",
        type = "method"
      },
      setCallback = {
        args = "(callback: fun()))",
        description = "Sets the callback function for this menu item.",
        returns = "(fun(self: pd_item, callback: fun()))",
        type = "method"
      },
      setTitle = {
        args = "(newTitle: string))",
        description = "Sets the title displayed for this menu item.\nThe title for a menu item can also be set using dot syntax.",
        returns = "(fun(self: pd_item, newTitle: string))",
        type = "method"
      },
      setValue = {
        args = "(newValue: integer|boolean|string))",
        description = "Sets the value for this menu item. The value is of a different type depending on the type of menu item:\nnormal: integer\ncheckmark: boolean\noptions: string\nValues for any menu type can also be set using integers.\nThe value for a menu item can also be set using dot syntax.",
        returns = "(fun(self: pd_item, newValue: integer|boolean|string))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_language = {
    type = "class"
  },
  pd_lfo = {
    childs = {
      getValue = {
        args = "()",
        description = "Returns the current signal value of the LFO.",
        returns = "(number)",
        type = "method"
      },
      setArpeggio = {
        args = "(note1: number, ...: number))",
        description = "Sets the LFO type to arpeggio, where the given values are in half-steps from the center note. For example, the sequence (0, 4, 7, 12) plays the notes of a major chord.",
        returns = "(fun(self: pd_lfo, note1: number, ...: number))",
        type = "method"
      },
      setCenter = {
        args = "(center: number))",
        description = "Sets the center value of the LFO.",
        returns = "(fun(self: pd_lfo, center: number))",
        type = "method"
      },
      setDelay = {
        args = "(holdoff: number, ramp: number))",
        description = "Sets an initial holdoff time for the LFO where the LFO remains at its center value, and a ramp time where the value increases linearly to its maximum depth. Values are in seconds.",
        returns = "(fun(self: pd_lfo, holdoff: number, ramp: number))",
        type = "method"
      },
      setDepth = {
        args = "(depth: number))",
        description = "Sets the depth of the LFO’s modulation.",
        returns = "(fun(self: pd_lfo, depth: number))",
        type = "method"
      },
      setGlobal = {
        args = "(flag: boolean))",
        description = "If an LFO is marked global, it is continuously updated whether or not it’s attached to any source.",
        returns = "(fun(self: pd_lfo, flag: boolean))",
        type = "method"
      },
      setPhase = {
        args = "(phase: number))",
        description = "Sets the current phase of the LFO, from 0 to 1.",
        returns = "(fun(self: pd_lfo, phase: number))",
        type = "method"
      },
      setRate = {
        args = "(rate: number))",
        description = "Sets the rate of the LFO, in cycles per second.",
        returns = "(fun(self: pd_lfo, rate: number))",
        type = "method"
      },
      setRetrigger = {
        args = "(flag: boolean))",
        description = "If retrigger is on, the LFO’s phase is reset to its initial phase (default 0) when a synth using the LFO starts playing a note.",
        returns = "(fun(self: pd_lfo, flag: boolean))",
        type = "method"
      },
      setStartPhase = {
        args = "(phase: number))",
        description = "Sets the initial phase of the LFO, from 0 to 1.",
        returns = "(fun(self: pd_lfo, phase: number))",
        type = "method"
      },
      setType = {
        args = "(type: pd_lfo_type))",
        description = "Sets the waveform of the LFO. Valid values are\n`playdate.sound.kLFOSquare`\n`playdate.sound.kLFOSawtoothUp`\n`playdate.sound.kLFOSawtoothDown`\n`playdate.sound.kLFOTriangle`\n`playdate.sound.kLFOSine`\n`playdate.sound.kLFOSampleAndHold`",
        returns = "(fun(self: pd_lfo, type: pd_lfo_type))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_lfo_type = {
    type = "class"
  },
  pd_lineSegment = {
    childs = {
      closestPointOnLineToPoint = {
        args = "(p: pd_point)",
        description = "Returns a playdate.geometry.point that is the closest point to point `p` that is on the line segment.",
        returns = "(pd_point)",
        type = "method"
      },
      copy = {
        args = "()",
        description = "Returns a new copy of the line segment.",
        returns = "(pd_lineSegment)",
        type = "method"
      },
      intersectsLineSegment = {
        args = "(ls: pd_lineSegment)",
        description = "Returns true if there is an intersection between the caller and the line segment `ls`.\nIf there is an intersection, a playdate.geometry.point representing that point is also returned.",
        returns = "(boolean)",
        type = "method"
      },
      intersectsPolygon = {
        args = "(poly: pd_polygon)",
        description = "Returns the values (`intersects`, `intersectionPoints`).\n`intersects` is true if there is at least one intersection between the caller and poly.\n`intersectionPoints` is an array of playdate.geometry.points containing all intersection points between the caller and poly.",
        returns = "((boolean, pd_point[]))",
        type = "method"
      },
      intersectsRect = {
        args = "(rect: pd_rect)",
        description = "Returns the values (`intersects`, `intersectionPoints`).\n`intersects` is true if there is at least one intersection between the caller and rect.\n`intersectionPoints` is an array of playdate.geometry.points containing all intersection points between the caller and rect.",
        returns = "((boolean, pd_point[]))",
        type = "method"
      },
      length = {
        args = "()",
        description = "Returns the length of the line segment.",
        returns = "(number)",
        type = "method"
      },
      midPoint = {
        args = "()",
        description = "Returns a playdate.geometry.point representing the mid point of the line segment.",
        returns = "(pd_point)",
        type = "method"
      },
      offset = {
        args = "(dx: number, dy: number))",
        description = "Modifies the line segment, offsetting its values by `dx`, `dy`.",
        returns = "(fun(self: pd_lineSegment, dx: number, dy: number))",
        type = "method"
      },
      offsetBy = {
        args = "(dx: number, dy: number)",
        description = "Returns a new line segment, the given segment offset by `dx`, `dy`.",
        returns = "(pd_lineSegment)",
        type = "method"
      },
      pointOnLine = {
        args = "(distance: number, extend?: boolean)",
        description = "Returns a playdate.geometry.point on the line segment, distance pixels from the start of the line. If extend is true, the returned point is allowed to project past the segment’s endpoints; otherwise, it is constrained to the line segment’s initial point if distance is negative, or the end point if distance is greater than the segment’s length.",
        returns = "(pd_point)",
        type = "method"
      },
      segmentVector = {
        args = "()",
        description = "Returns a playdate.geometry.vector2D representation of the line segment.",
        returns = "(pd_vector2D)",
        type = "method"
      },
      unpack = {
        args = "()",
        description = "Returns the values `x1, y1, x2, y2`.",
        returns = "((number, number, number, number))",
        type = "method"
      },
      x1 = {
        description = "You can directly read or write `x1`, `y1`, `x2`, or `y2` values to a lineSegment.",
        returns = "(number)",
        type = "value"
      },
      x2 = {
        description = "You can directly read or write `x1`, `y1`, `x2`, or `y2` values to a lineSegment.",
        returns = "(number)",
        type = "value"
      },
      y1 = {
        description = "You can directly read or write `x1`, `y1`, `x2`, or `y2` values to a lineSegment.",
        returns = "(number)",
        type = "value"
      },
      y2 = {
        description = "You can directly read or write `x1`, `y1`, `x2`, or `y2` values to a lineSegment.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_line_cap_style = {
    type = "class"
  },
  pd_line_collision_info = {
    childs = {
      entryPoint = {
        returns = "(pd_point)",
        type = "value"
      },
      exitPoint = {
        returns = "(pd_point)",
        type = "value"
      },
      sprite = {
        returns = "(pd_sprite)",
        type = "value"
      },
      ti1 = {
        returns = "(number)",
        type = "value"
      },
      ti2 = {
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_loop = {
    childs = {
      draw = {
        args = "(x: number, y: number, flip?: pd_image_flip))",
        description = "Draw’s the loop’s current image at `x`, `y`.\nThe `flip` argument is optional; see playdate.graphics.image:draw() for valid values.",
        returns = "(fun(self: pd_loop, x: number, y: number, flip?: pd_image_flip | nil)",
        type = "method"
      },
      image = {
        args = "()",
        description = "Returns a playdate.graphics.image from the caller’s `imageTable` if it exists. The image returned will be at the imageTable’s index that matches the caller’s `frame`.",
        returns = "(pd_image)",
        type = "method"
      },
      isValid = {
        args = "()",
        description = "Returns false if the loop has passed its last frame and does not loop.",
        returns = "(boolean)",
        type = "method"
      },
      setImageTable = {
        args = "(imageTable: pd_imagetable))",
        description = "Sets the playdate.graphics.imagetable to be used for this animation loop, and sets the loop’s endFrame property to #imageTable.",
        returns = "(fun(self: pd_loop, imageTable: pd_imagetable))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_menu = {
    childs = {
      addCheckmarkMenuItem = {
        args = "(title: string, initialValue?: number, callback?: fun(boolean))",
        description = "Creates a new menu item that can be checked or unchecked by the player.\n`title` will be the title displayed by the menu item.\n`initialValue` can be set to true or false, indicating the checked state of the menu item. Optional, defaults to false.\nIf this menu item is interacted with while the system menu is open, `callback` will be called when the menu is closed, before playdate.gameWillResume is called. The callback function will be passed one argument, a boolean value, indicating the current value of the menu item.\nIf the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.\nPlaydate OS allows a maximum of three custom menu items to be added to the System Menu.",
        returns = "(pd_item)",
        type = "method"
      },
      addMenuItem = {
        args = "(title: string, callback: fun()))",
        description = "`title` will be the title displayed by the menu item.",
        returns = "(fun(self: pd_menu, title: string, callback: fun()))",
        type = "method"
      },
      addOptionsMenuItem = {
        args = "(title: string, options: string[], initalValue?: string, callback?: fun(string))",
        description = "Creates a menu item that allows the player to cycle through a set of options.\n`title` will be the title displayed by the menu item.\n`options` should be an array-style table of strings representing the states the menu item can have. Due to limited horizontal space, the option strings and title should be kept short for this type of menu item.\n`initialValue` can optionally be set to any of the values in the options array.\nIf the value of this menu item is changed while the system menu is open, `callback` will be called when the menu is closed, before playdate.gameWillResume is called. The callback function will be passed one string argument indicating the currently selection option.\nIf the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.\nPlaydate OS allows a maximum of three custom menu items to be added to the System Menu.",
        returns = "(pd_item)",
        type = "method"
      },
      getMenuItems = {
        args = "()",
        description = "Returns an array-style table containing all playdate.menu.items your game has added to the menu.",
        returns = "(pd_item[])",
        type = "method"
      },
      removeAllMenuItems = {
        args = "()",
        description = "Removes from the referenced menu object all playdate.menu.items added by your game.\nItems that were added to the System Menu by the operating system cannot be removed by this operation, or any other.",
        returns = "(fun(self: pd_menu))",
        type = "method"
      },
      removeMenuItem = {
        args = "(menuItem: pd_item))",
        description = "Removes the specified playdate.menu.item from the menu.",
        returns = "(fun(self: pd_menu, menuItem: pd_item))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_metadata = {
    childs = {
      buildNumber = {
        description = "A monotonically-increasing integer value used to indicate a unique version of your game. This can be set using an automated build process like Continuous Integration to avoid having to set the value by hand.",
        returns = "(integer)",
        type = "value"
      },
      bundleID = {
        description = "A unique identifier for your game, in reverse DNS notation.",
        returns = "(string)",
        type = "value"
      },
      contentWarning = {
        description = "Optional. A content warning that displays when the user launches your game for the first time. The user will have the option of backing out and not launching your game if they choose.",
        returns = "(string?)",
        type = "value"
      },
      contentWarning2 = {
        description = "Optional. A second content warning that displays on a second screen when the user launches your game for the first time. The user will have the option of backing out and not launching your game if they choose. Note: contentWarning2 will only display if a contentWarning attribute is also specified.",
        returns = "(string?)",
        type = "value"
      },
      imagePath = {
        description = "A directory of images that will be used by the launcher.",
        returns = "(string)",
        type = "value"
      },
      launchSoundPath = {
        description = "Optional. Should point to the path of a short audio file to be played as the game launch animation is taking place.",
        returns = "(string?)",
        type = "value"
      },
      version = {
        description = "A game version number, formatted any way you wish, that is displayed to players. It is not used to compute when updates should occur.",
        returns = "(string)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_nineSlice = {
    childs = {
      drawInRect = {
        args = "(fun(self: pd_nineSlice, x: number, y: number, width: number, height: number)) | (fun(self: pd_nineSlice, rect: pd_rect))",
        description = "Draws the 9 slice image at the desired coordinates by stretching the defined region to achieve the width and height inputs.",
        returns = "((fun(self: pd_nineSlice, x: number, y: number, width: number, height: number)) | (fun(self: pd_nineSlice, rect: pd_rect)))",
        type = "function"
      },
      getMinSize = {
        args = "()",
        description = "Returns the minimum size of the 9 slice image as a pair `(width, height)`.",
        returns = "((number, number))",
        type = "method"
      },
      getSize = {
        args = "()",
        description = "Returns the size of the 9 slice image as a pair `(width, height)`.",
        returns = "((number, number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_node = {
    childs = {
      addConnection = {
        args = "(node: pd_node, weight: number, addReciprocalConnection: boolean))",
        description = "Adds a new connection between nodes.\n`node`: The node the new connection will point to.\n`weight`: Weight for the new connection. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.\n`addReciprocalConnection`: If true, a second connection will be created with the same weight in the opposite direction.",
        returns = "(fun(self: pd_node, node: pd_node, weight: number, addReciprocalConnection: boolean))",
        type = "method"
      },
      addConnectionToNodeWithXY = {
        args = "(x: number, y: number, weight: number, addReciprocalConnection: boolean))",
        description = "Adds a connection to the first node found with matching `x` and `y` values, if it exists.\n`weight`: The weight for the new connection. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.\n`addReciprocalConnections`: If true, a connection will also be added in the reverse direction, from the node at x, y to the caller.",
        returns = "(fun(self: pd_node, x: number, y: number, weight: number, addReciprocalConnection: boolean))",
        type = "method"
      },
      addConnections = {
        args = "(nodes: pd_node[], weights: number[], addReciprocalConnections: boolean))",
        description = "Adds a new connection to each node in the nodes array.\n`nodes`: An array of nodes which the new connections will point to.\n`weights`: An array of weights for the new connections. Must be of the same length as the nodes array. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.\n`addReciprocalConnections`: If true, connections will also be added in the reverse direction for each node.",
        returns = "(fun(self: pd_node, nodes: pd_node[], weights: number[], addReciprocalConnections: boolean))",
        type = "method"
      },
      connectedNodes = {
        args = "()",
        description = "Returns an array of nodes that have been added as connections to this node.",
        returns = "(pd_node[])",
        type = "method"
      },
      id = {
        description = "You can directly read or write `x`, `y` and `id` values on a `playdate.pathfinder.node`.",
        returns = "(integer)",
        type = "value"
      },
      removeAllConnections = {
        args = "(removeIncoming?: boolean))",
        description = "Removes all connections from the calling node.\nIf removeIncoming is true, all connections from other nodes to the calling node are also removed. False by default. Please note: this can signficantly increase the time this function takes as it requires a full search of the graph - O(1) vs O(n)).",
        returns = "(fun(self: pd_node, removeIncoming?: boolean | nil)",
        type = "method"
      },
      removeConnection = {
        args = "(node: pd_node, removeReciprocal?: boolean))",
        description = "Removes a connection to node, if it exists. If `removeReciprocal` is true the reverse connection will also be removed, if it exists.",
        returns = "(fun(self: pd_node, node: pd_node, removeReciprocal?: boolean | nil)",
        type = "method"
      },
      setXY = {
        args = "(x: number, y: number))",
        description = "Sets the `x` and `y` values for the node.",
        returns = "(fun(self: pd_node, x: number, y: number))",
        type = "method"
      },
      x = {
        description = "You can directly read or write `x`, `y` and `id` values on a `playdate.pathfinder.node`.",
        returns = "(number)",
        type = "value"
      },
      y = {
        description = "You can directly read or write `x`, `y` and `id` values on a `playdate.pathfinder.node`.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_note_table = {
    childs = {
      length = {
        returns = "(number)",
        type = "value"
      },
      note = {
        returns = "(number)",
        type = "value"
      },
      step = {
        returns = "(number)",
        type = "value"
      },
      velocity = {
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_onepolefilter = {
    childs = {
      setMix = {
        args = "(level: number))",
        description = "Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.",
        returns = "(fun(self: pd_onepolefilter, level: number))",
        type = "method"
      },
      setMixMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the mix level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_onepolefilter, signal: pd_signal? | nil)",
        type = "method"
      },
      setParameter = {
        args = "(p: number))",
        description = "Sets the filter’s single parameter (cutoff frequency) to `p`.",
        returns = "(fun(self: pd_onepolefilter, p: number))",
        type = "method"
      },
      setParameterMod = {
        args = "(m: pd_signal))",
        description = "Sets a modulator for the filter’s parameter. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_onepolefilter, m: pd_signal))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_overdrive = {
    childs = {
      setGain = {
        args = "(level: number))",
        description = "Sets the gain of the filter.",
        returns = "(fun(self: pd_overdrive, level: number))",
        type = "method"
      },
      setLimit = {
        args = "(level: number))",
        description = "Sets the level where the amplified input clips.",
        returns = "(fun(self: pd_overdrive, level: number))",
        type = "method"
      },
      setLimitMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the limit level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_overdrive, signal: pd_signal? | nil)",
        type = "method"
      },
      setMix = {
        args = "(level: number))",
        description = "Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.",
        returns = "(fun(self: pd_overdrive, level: number))",
        type = "method"
      },
      setMixMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the mix level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_overdrive, signal: pd_signal? | nil)",
        type = "method"
      },
      setOffset = {
        args = "(level: number))",
        description = "Adds an offset to the upper and lower limits to create an asymmetric clipping.",
        returns = "(fun(self: pd_overdrive, level: number))",
        type = "method"
      },
      setOffsetMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the offset value. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_overdrive, signal: pd_signal? | nil)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_point = {
    childs = {
      copy = {
        args = "()",
        description = "Returns a new copy of the point.",
        returns = "(pd_point)",
        type = "method"
      },
      distanceToPoint = {
        args = "(p: pd_point)",
        description = "Returns the distance to point `p`.",
        returns = "(number)",
        type = "method"
      },
      offset = {
        args = "(dx: number, dy: number))",
        description = "Modifies the point, offsetting its values by `dx`, `dy`.",
        returns = "(fun(self: pd_point, dx: number, dy: number))",
        type = "method"
      },
      offsetBy = {
        args = "(dx: number, dy: number)",
        description = "Returns a new point object, the given point offset by `dx`, `dy`.",
        returns = "(pd_point)",
        type = "method"
      },
      squaredDistanceToPoint = {
        args = "(p: pd_point)",
        description = "Returns the square of the distance to point `p`.",
        returns = "(number)",
        type = "method"
      },
      unpack = {
        args = "()",
        description = "Returns the values `x, y`.",
        returns = "((number, number))",
        type = "method"
      },
      x = {
        description = "Returns a new point by adding the vector `v` to point `p`.\nReturns the vector constructed by subtracting `p2` from `p1`. By this construction, `p2` + (`p1` - `p2`) == `p1`.\nReturns a new polygon formed by applying the transform `t` to polygon `p`.\nReturns a new lineSegment connecting points `p1` and `p2`.\nYou can directly read or write the `x` and `y` values of a point.",
        returns = "(number)",
        type = "value"
      },
      y = {
        description = "You can directly read or write the `x` and `y` values of a point.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_polygon = {
    childs = {
      close = {
        args = "()",
        description = ":close() closes a polygon. If the polygon’s first and last point aren’t coincident, a line segment will be generated to connect them.",
        returns = "(fun(self: pd_polygon))",
        type = "method"
      },
      containsPoint = {
        args = "(fun(self: pd_polygon, p: pd_point, fillRule?: pd_polygon_fill_rule): boolean) | (fun(self: pd_polygon, x: number, y: number, fillRule?: pd_polygon_fill_rule",
        description = "Returns a boolean value, true if the point `p` or the point at `(x, y)` is contained within the caller polygon.\nfillrule is an optional argument that can be one of the values defined in playdate.graphics.setPolygonFillRule. By default `playdate.graphics.kPolygonFillEvenOdd` is used.",
        returns = "(boolean))",
        type = "function"
      },
      copy = {
        args = "()",
        description = "Returns a copy of a polygon.",
        returns = "(pd_polygon)",
        type = "method"
      },
      count = {
        args = "()",
        description = "Returns the number of points in the polygon.",
        returns = "(number)",
        type = "method"
      },
      getBounds = {
        args = "()",
        description = "Returns multiple values (`x`, `y`, `width`, `height`) giving the axis-aligned bounding box for the polygon.",
        returns = "((number, number, number, number))",
        type = "method"
      },
      getBoundsRect = {
        args = "()",
        description = "Returns the axis-aligned bounding box for the given polygon as a playdate.geometry.rect object.",
        returns = "(pd_rect)",
        type = "method"
      },
      getPointAt = {
        args = "(n: number)",
        description = "Returns the polygon’s `n`-th point.",
        returns = "(pd_point)",
        type = "method"
      },
      intersects = {
        args = "(p: pd_polygon)",
        description = "Returns true if the given polygon intersects the polygon `p`.",
        returns = "(boolean)",
        type = "method"
      },
      isClosed = {
        args = "()",
        description = "Returns true if the polygon is closed, false if not.",
        returns = "(boolean)",
        type = "method"
      },
      length = {
        args = "()",
        description = "Returns the total length of all line segments in the polygon.",
        returns = "(number)",
        type = "method"
      },
      pointOnPolygon = {
        args = "(distance: number, extend?: boolean)",
        description = "Returns a playdate.geometry.point on one of the polygon’s line segments, distance pixels from the start of the polygon. If extend is true, the point is allowed to project past the polygon’s ends; otherwise, it is constrained to the polygon’s initial point if distance is negative, or the last point if distance is greater than the polygon’s length.",
        returns = "(pd_point)",
        type = "method"
      },
      setPointAt = {
        args = "(n: number, x: number, y: number))",
        description = "Sets the polygon’s `n`-th point to (`x`, `y`).",
        returns = "(fun(self: pd_polygon, n: number, x: number, y: number))",
        type = "method"
      },
      translate = {
        args = "(dx: number, dy: number))",
        description = "Translates each point on the polygon by `dx`, `dy` pixels.",
        returns = "(fun(self: pd_polygon, dx: number, dy: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_polygon_fill_rule = {
    type = "class"
  },
  pd_rect = {
    childs = {
      bottom = {
        description = "**READ-ONLY**. While you can directly read or write `x`, `y`, `width`, or `height` values to a rect, the values of `top`, `bottom`, `right`, `left`, `origin`, and `size` are read-only.",
        returns = "(READONLY_number)",
        type = "value"
      },
      centerPoint = {
        args = "()",
        description = "Returns a point at the center of the caller.",
        returns = "(pd_point)",
        type = "method"
      },
      containsPoint = {
        args = "(fun(self: pd_rect, p: pd_point): boolean) | (fun(self: pd_rect, x: number, y: number",
        description = "### Overload 1 ###\nReturns true if the point `p` is contained within the caller rect.\n### Overload 2 ###\nReturns true if the point at `(x, y)` is contained within the caller rect.",
        returns = "(boolean))",
        type = "function"
      },
      containsRect = {
        args = "(fun(self: pd_rect, r2: pd_rect): boolean) | (fun(self: pd_rect, x: number, y: number, width: number, height: number",
        description = "### Overload 1 ###\nReturns true if the rect `r2` is contained within the caller rect.\n### Overload 2 ###\nReturns true if the rect defined by `(x, y, width, height)` is contained within the caller rect.",
        returns = "(boolean))",
        type = "function"
      },
      copy = {
        args = "()",
        description = "Returns a new copy of the rect.",
        returns = "(pd_rect)",
        type = "method"
      },
      flipRelativeToRect = {
        args = "(r2: pd_rect, flip: pd_flip))",
        description = "Flips the caller about the center of rect `r2`.\n`flip` should be one of the following constants:\n`playdate.geometry.kUnflipped`\n`playdate.geometry.kFlippedX`\n`playdate.geometry.kFlippedY`\n`playdate.geometry.kFlippedXY`",
        returns = "(fun(self: pd_rect, r2: pd_rect, flip: pd_flip))",
        type = "method"
      },
      height = {
        description = "You can directly read or write `x`, `y`, `width`, or `height` values to a rect.",
        returns = "(number)",
        type = "value"
      },
      inset = {
        args = "(dx: number, dy: number))",
        description = "Insets the rect by the given `dx` and `dy`.",
        returns = "(fun(self: pd_rect, dx: number, dy: number))",
        type = "method"
      },
      insetBy = {
        args = "(dx: number, dy: number)",
        description = "Returns a rect that is inset by the given `dx` and `dy`, with the same center point.",
        returns = "(pd_rect)",
        type = "method"
      },
      intersection = {
        args = "(r2: pd_rect)",
        description = "Returns a rect representing the overlapping portion of the caller and `r2`.",
        returns = "(pd_rect)",
        type = "method"
      },
      intersects = {
        args = "(r2: pd_rect)",
        description = "Returns true if `r2` intersects the caller.",
        returns = "(boolean)",
        type = "method"
      },
      isEmpty = {
        args = "()",
        description = "Returns true if a rectangle has zero width or height.",
        returns = "(boolean)",
        type = "method"
      },
      isEqual = {
        args = "(r2: pd_rect)",
        description = "Returns true if the `x`, `y`, `width`, and `height` values of the caller and `r2` are all equal.",
        returns = "(boolean)",
        type = "method"
      },
      left = {
        description = "**READ-ONLY**. While you can directly read or write `x`, `y`, `width`, or `height` values to a rect, the values of `top`, `bottom`, `right`, `left`, `origin`, and `size` are read-only.",
        returns = "(READONLY_number)",
        type = "value"
      },
      offset = {
        args = "(dx: number, dy: number))",
        description = "Offsets the rect by the given `dx` and `dy`.",
        returns = "(fun(self: pd_rect, dx: number, dy: number))",
        type = "method"
      },
      offsetBy = {
        args = "(dx: number, dy: number)",
        description = "Returns a rect with its origin point offset by `dx`, `dy`.",
        returns = "(pd_rect)",
        type = "method"
      },
      origin = {
        description = "**READ-ONLY**. While you can directly read or write `x`, `y`, `width`, or `height` values to a rect, the values of `top`, `bottom`, `right`, `left`, `origin`, and `size` are read-only.",
        returns = "(READONLY_pd_point)",
        type = "value"
      },
      right = {
        description = "**READ-ONLY**. While you can directly read or write `x`, `y`, `width`, or `height` values to a rect, the values of `top`, `bottom`, `right`, `left`, `origin`, and `size` are read-only.",
        returns = "(READONLY_number)",
        type = "value"
      },
      size = {
        description = "**READ-ONLY**. While you can directly read or write `x`, `y`, `width`, or `height` values to a rect, the values of `top`, `bottom`, `right`, `left`, `origin`, and `size` are read-only.",
        returns = "(READONLY_pd_size)",
        type = "value"
      },
      toPolygon = {
        args = "()",
        description = "Returns a new playdate.geometry.polygon version of the rect.",
        returns = "(pd_rect)",
        type = "method"
      },
      top = {
        description = "**READ-ONLY**. While you can directly read or write `x`, `y`, `width`, or `height` values to a rect, the values of `top`, `bottom`, `right`, `left`, `origin`, and `size` are read-only.",
        returns = "(READONLY_number)",
        type = "value"
      },
      union = {
        args = "(r2: pd_rect)",
        description = "Returns the smallest possible rect that contains both the source rect and `r2`.",
        returns = "(pd_rect)",
        type = "method"
      },
      unpack = {
        args = "()",
        description = "Returns `x`, `y`, `width` and `height` as individual values.",
        returns = "((number, number, number, number))",
        type = "method"
      },
      width = {
        description = "You can directly read or write `x`, `y`, `width`, or `height` values to a rect.",
        returns = "(number)",
        type = "value"
      },
      x = {
        description = "You can directly read or write `x`, `y`, `width`, or `height` values to a rect.",
        returns = "(number)",
        type = "value"
      },
      y = {
        description = "You can directly read or write `x`, `y`, `width`, or `height` values to a rect.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_ringmod = {
    childs = {
      setFrequency = {
        args = "(f: number))",
        description = "Sets the ringmod frequency to `f`.",
        returns = "(fun(self: pd_ringmod, f: number))",
        type = "method"
      },
      setFrequencyMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the ringmod frequency. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_ringmod, signal: pd_signal? | nil)",
        type = "method"
      },
      setMix = {
        args = "(level: number))",
        description = "Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.",
        returns = "(fun(self: pd_ringmod, level: number))",
        type = "method"
      },
      setMixMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the mix level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_ringmod, signal: pd_signal? | nil)",
        type = "method"
      }
    },
    type = "class"
  },
  pd_sample = {
    childs = {
      decompress = {
        args = "()",
        description = "If the sample is ADPCM compressed, decompresses the sample data to 16-bit PCM data. This increases the sample’s memory footprint by 4x and does not affect the quality in any way, but it is necessary if you want to use the sample in a synth or play the file backwards. Returns true if successful, or false and an error message as a second return value if decompression failed.",
        returns = "(boolean)",
        type = "method"
      },
      getFormat = {
        args = "()",
        description = "Returns the format of the sample, one of\n`playdate.sound.kFormat8bitMono`\n`playdate.sound.kFormat8bitStereo`\n`playdate.sound.kFormat16bitMono`\n`playdate.sound.kFormat16bitStereo`",
        returns = "(pd_sound_format)",
        type = "method"
      },
      getLength = {
        args = "()",
        description = "Returns two values, the length of the available sample data and the size of the allocated buffer. Both values are measured in seconds. For a sample loaded from disk, these will be the same; for a sample used for recording, the available data may be less than the allocated size.",
        returns = "((number, number))",
        type = "method"
      },
      getSampleRate = {
        args = "()",
        description = "Returns the sample rate as an integer, such as 44100 or 22050.",
        returns = "(number)",
        type = "method"
      },
      getSubsample = {
        args = "(startOffset: number, endOffset: number)",
        description = "Returns a new subsample containing a subrange of the given sample. Offset values are in frames, not bytes.",
        returns = "(pd_sample)",
        type = "method"
      },
      load = {
        args = "(path: string)",
        description = "Loads the sound data from the file at `path` into an existing sample buffer. If there is no file at `path`, the function returns nil.",
        returns = "(pd_UNDOCUMENTED | nil)",
        type = "method"
      },
      play = {
        args = "(repeatCount?: number, rate?: number))",
        description = "Convenience function: Creates a new sampleplayer for the sample and passes the function arguments to its play function.",
        returns = "(fun(self: pd_sample, repeatCount?: number, rate?: number | nil)",
        type = "method"
      },
      playAt = {
        args = "(when: number, vol?: number, rightvol?: number, rate?: number))",
        description = "Convenience function: Creates a new sampleplayer for the sample and passes the function arguments to its playAt function.",
        returns = "(fun(self: pd_sample, when: number, vol?: number, rightvol?: number, rate?: number | nil)",
        type = "method"
      },
      save = {
        args = "(filename: string))",
        description = "Saves the sample to the given file. If filename has a .wav extension it will be saved in WAV format (and be unreadable by the Playdate sound functions), otherwise it will be saved in the Playdate pda format.",
        returns = "(fun(self: pd_sample, filename: string))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_sampleplayer = {
    childs = {
      copy = {
        args = "()",
        description = "Returns a new playdate.sound.sampleplayer with the same sample, volume, and rate as the given sampleplayer.",
        returns = "(pd_sampleplayer)",
        type = "method"
      },
      getLength = {
        args = "()",
        description = "Returns the length of the sampleplayer’s sample, in seconds. Length is not scaled by playback rate.",
        returns = "(number)",
        type = "method"
      },
      getOffset = {
        args = "()",
        description = "Returns the current offset of the sampleplayer, in seconds. This value is not adjusted for rate.",
        returns = "(number)",
        type = "method"
      },
      getRate = {
        args = "()",
        description = "Returns the playback rate for the sample.",
        returns = "(number)",
        type = "method"
      },
      getSample = {
        args = "()",
        description = "Gets the sample to be played.",
        returns = "(pd_sample)",
        type = "method"
      },
      getVolume = {
        args = "()",
        description = "Returns the playback volume for the sampleplayer, a single value for mono sources or a pair of values (left, right) for stereo sources.",
        returns = "(number)",
        type = "method"
      },
      isPlaying = {
        args = "()",
        description = "Returns a boolean indicating whether the sample is playing.",
        returns = "(boolean)",
        type = "method"
      },
      play = {
        args = "(repeatCount?: number, rate?: number))",
        description = "Starts playing the sample. If `repeatCount` is greater than one, it loops the given number of times. If zero, it loops endlessly until it is stopped with playdate.sound.sampleplayer:stop(). If `rate` is set, the sample will be played at the given rate instead of the rate previous set with playdate.sound.sampleplayer.setRate().",
        returns = "(fun(self: pd_sampleplayer, repeatCount?: number, rate?: number | nil)",
        type = "method"
      },
      playAt = {
        args = "(when: number, vol?: number, rightvol?: number, rate?: number)",
        description = "Schedules the sound for playing at device time `when`. If `vol` is specified, the sample will be played at level `vol` (with optional separate right channel volume `rightvol`), otherwise it plays at the volume set by playdate.sound.sampleplayer.setVolume(). Note that the `when` argument is an offset in the audio device’s time scale, as returned by playdate.sound.getCurrentTime(); it is not relative to the current time! If `when` is less than the current audio time, the sample is played immediately. If `rate` is set, the sample will be played at the given rate instead of the rate previously set with playdate.sound.sampleplayer.setRate().\nOnly one event can be queued at a time. If playAt() is called while another event is queued, it will overwrite it with the new values.\nThe function returns true if the sample was successfully added to the sound channel, otherwise false (i.e., if the channel is full).",
        returns = "(boolean)",
        type = "method"
      },
      setFinishCallback = {
        args = "(func: fun(pd_sample, any), arg?: any))",
        description = "Sets a function to be called when playback has completed. The sample object is passed to this function as the first argument, and the optional `arg` argument is passed as the second.",
        returns = "(fun(self: pd_sampleplayer, func: fun(pd_sample, any), arg?: any | nil)",
        type = "method"
      },
      setLoopCallback = {
        args = "(callback: fun(pd_sample, any), arg?: any))",
        description = "Sets a function to be called every time the sample loops. The sample object is passed to this function as the first argument, and the optional `arg` argument is passed as the second.",
        returns = "(fun(self: pd_sampleplayer, callback: fun(pd_sample, any), arg?: any | nil)",
        type = "method"
      },
      setOffset = {
        args = "(seconds: number))",
        description = "Sets the current offset of the sampleplayer, in seconds. This value is not adjusted for rate.",
        returns = "(fun(self: pd_sampleplayer, seconds: number))",
        type = "method"
      },
      setPaused = {
        args = "(flag: boolean))",
        description = "Pauses or resumes playback.",
        returns = "(fun(self: pd_sampleplayer, flag: boolean))",
        type = "method"
      },
      setPlayRange = {
        args = "(start: number, end: number))",
        description = "Sets the range of the sample to play. `start` and `end` are frame offsets from the beginning of the sample.",
        returns = "(fun(self: pd_sampleplayer, start: number, end: number))",
        type = "method"
      },
      setRate = {
        args = "(rate: number))",
        description = "Sets the playback rate for the sample. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Sampleplayers can also play samples backwards, by setting a negative rate; note, however, this does not work with ADPCM-encoded files.",
        returns = "(fun(self: pd_sampleplayer, rate: number))",
        type = "method"
      },
      setRateMod = {
        args = "(signal: pd_signal?))",
        description = "Sets the signal to use as a rate modulator, added to the rate set with playdate.sound.sampleplayer:setRate(). Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_sampleplayer, signal: pd_signal? | nil)",
        type = "method"
      },
      setSample = {
        args = "(sample: pd_sample))",
        description = "Sets the sample to be played.",
        returns = "(fun(self: pd_sampleplayer, sample: pd_sample))",
        type = "method"
      },
      setVolume = {
        args = "(left: number, right?: number))",
        description = "Sets the playback volume (0.0 - 1.0) for left and right channels. If the optional `right` argument is omitted, it is the same as `left`. If the sampleplayer is currently playing using the default volume (that is, it wasn’t triggered by playAt() with a volume given) it also changes the volume of the playing sample.",
        returns = "(fun(self: pd_sampleplayer, left: number, right?: number | nil)",
        type = "method"
      },
      stop = {
        args = "()",
        description = "Stops playing the sample.",
        returns = "(fun(self: pd_sampleplayer))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_seek_mode = {
    type = "class"
  },
  pd_sequence = {
    childs = {
      addTrack = {
        args = "(track?: pd_track)",
        description = "Adds the given playdate.sound.track to the sequence. If track omitted, the function creates and returns a new track.",
        returns = "(pd_track | nil)",
        type = "method"
      },
      allNotesOff = {
        args = "()",
        description = "Sends an allNotesOff() message to each track’s instrument.",
        returns = "(fun(self: pd_sequence))",
        type = "method"
      },
      getCurrentStep = {
        args = "()",
        description = "Returns the step number the sequence is currently at.",
        returns = "(integer)",
        type = "method"
      },
      getLength = {
        args = "()",
        description = "Returns the length of the longest track in the sequence, in steps. See also playdate.sound.track.getLength().",
        returns = "(number)",
        type = "method"
      },
      getTempo = {
        args = "()",
        description = "Returns the tempo of the sequence, in steps per second.",
        returns = "(number)",
        type = "method"
      },
      getTrackAtIndex = {
        args = "(n: integer)",
        description = "Returns the playdate.sound.track object at position n in the sequence.",
        returns = "(pd_track)",
        type = "method"
      },
      getTrackCount = {
        args = "()",
        description = "Returns the number of tracks in the sequence.",
        returns = "(number)",
        type = "method"
      },
      goToStep = {
        args = "(step: integer, play?: boolean))",
        description = "Moves the play position for the sequence to step number step. If play is set, triggers the notes at that step.",
        returns = "(fun(self: pd_sequence, step: integer, play?: boolean | nil)",
        type = "method"
      },
      isPlaying = {
        args = "()",
        description = "Returns true if the sequence is currently playing.",
        returns = "(boolean)",
        type = "method"
      },
      play = {
        args = "(finishCallback?: fun(pd_sequence)))",
        description = "Starts playing the sequence. finishCallback is an optional function to be called when the sequence finishes playing or is stopped. The sequence is passed to the callback as its single argument.",
        returns = "(fun(self: pd_sequence, finishCallback?: fun(pd_sequence) | nil)",
        type = "method"
      },
      setLoops = {
        args = "(fun(self: pd_sequence, startStep: integer, endStep: integer, loopCount?: number)) | (fun(self: pd_sequence, loopCount: number))",
        description = "### Overload 1 ###\nSets the looping range of the sequence. If `loops` is 0 or unset, the loop repeats endlessly.\n### Overload 2 ###\nSame as above, with startStep set to 0 and endStep set to sequence:getLength().",
        returns = "((fun(self: pd_sequence, startStep: integer, endStep: integer, loopCount?: number)) | (fun(self: pd_sequence, loopCount: number) | nil)",
        type = "function"
      },
      setTempo = {
        args = "(stepsPerSecond: number))",
        description = "Sets the tempo of the sequence, in steps per second.",
        returns = "(fun(self: pd_sequence, stepsPerSecond: number))",
        type = "method"
      },
      setTrackAtIndex = {
        args = "(n: integer, track: pd_track))",
        description = "Sets the given playdate.sound.track object at position n in the sequence.",
        returns = "(fun(self: pd_sequence, n: integer, track: pd_track))",
        type = "method"
      },
      stop = {
        args = "()",
        description = "Stops playing the sequence.",
        returns = "(fun(self: pd_sequence))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_signal = {
    childs = {
      getValue = {
        args = "()",
        description = "Returns the current output value of the signal.",
        returns = "(number)",
        type = "method"
      },
      setOffset = {
        args = "(offset: number))",
        description = "Adds a constant offset to the signal (lfo, envelope, etc.).",
        returns = "(fun(self: pd_signal, offset: number))",
        type = "method"
      },
      setScale = {
        args = "(scale: number))",
        description = "Multiplies the signal’s output by the given scale factor. The scale is applied before the offset.",
        returns = "(fun(self: pd_signal, scale: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_size = {
    childs = {
      copy = {
        args = "()",
        description = "Returns a new copy of the size.",
        returns = "(pd_size)",
        type = "method"
      },
      height = {
        description = "You can directly read or write  the `width` and `height` values of a `size`.",
        returns = "(number)",
        type = "value"
      },
      unpack = {
        args = "()",
        description = "Returns the values `width, height`.",
        returns = "((number, number))",
        type = "method"
      },
      width = {
        description = "You can directly read or write  the `width` and `height` values of a `size`.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_sound_filter = {
    type = "class"
  },
  pd_sound_format = {
    type = "class"
  },
  pd_sprite = {
    childs = {
      add = {
        args = "()",
        description = "Adds the given sprite to the display list, so that it is drawn in the current scene.",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      addDirtyRect = {
        args = "(x: number, y: number, width: number, height: number))",
        description = "Marks the given rectangle (in screen coordinates) as needing a redraw. playdate.graphics drawing functions now call this automatically, adding their drawn areas to the sprite’s dirty list, so there’s likely no need to call this manually any more. This behavior may change in the future, though.",
        returns = "(fun(x: number, y: number, width: number, height: number))",
        type = "function"
      },
      alphaCollision = {
        args = "(anotherSprite: pd_sprite)",
        description = "Returns a boolean value set to true if a pixel-by-pixel comparison of the sprite images shows that non-transparent pixels are overlapping, based on the current bounds of the sprites.\nThis method may be used in conjunction with the standard collision architecture. Say, if overlappingSprites() or moveWithCollisions() report a collision of two sprite’s bounding rects, alphaCollision() could then be used to discern if a pixel-level collision occurred.",
        returns = "(boolean)",
        type = "method"
      },
      checkCollisions = {
        args = "(fun(self: pd_sprite, x: number, y: number): (number, number, pd_sprite_collision_info[], integer)) | (fun(self: pd_sprite, point: pd_point",
        description = "Returns the same values as moveWithCollisions() but does not actually move the sprite.",
        returns = "((number, number, pd_sprite_collision_info[], integer)))",
        type = "function"
      },
      clearClipRect = {
        args = "()",
        description = "Clears the sprite’s current clipping rectangle.",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      clearCollideRect = {
        args = "()",
        description = "Clears the sprite’s collide rect set with setCollideRect().",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      clearStencil = {
        args = "()",
        description = "Clears the sprite’s stencil.",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      collisionResponse = {
        args = "nil | ((fun(self: pd_sprite, other: pd_sprite",
        description = 'A callback that can be defined on a sprite to control the type of collision response that should happen when a collision with `other` occurs. This callback should return one of the following four values:\n`playdate.graphics.sprite.kCollisionTypeSlide`: Use for collisions that should slide over other objects, like Super Mario does over a platform or the ground.\n`playdate.graphics.sprite.kCollisionTypeFreeze`: Use for collisions where the sprite should stop moving as soon as it collides with `other`, such as an arrow hitting a wall.\n`playdate.graphics.sprite.kCollisionTypeOverlap`: Use for collisions in which you want to know about the collision but it should not impact the movement of the sprite, such as when collecting a coin.\n`playdate.graphics.sprite.kCollisionTypeBounce`: Use when the sprite should move away from `other`, like the ball in Pong or Arkanoid.\nThe strings "slide", "freeze", "overlap", and "bounce" can be used instead of the constants.\nFeel free to return different values based on the value of `other`. For example, if `other` is a wall sprite, you may want to return "slide" or "bounce", but if it’s a coin you might return "overlap".\nIf the callback is not present, or returns nil, `kCollisionTypeFreeze` is used.\nInstead of defining a callback, the collisionResponse property of a sprite can be set directly to one of the four collision response types. This will be faster, as the lua function will not need to be called, but does not allow for dynamic behavior.\nThis method should not attempt to modify the sprites in any way. While it might be tempting to deal with collisions here, doing so will have unexpected and undesirable results. Instead, this function should return one of the collision response values as quickly as possible. If sprites need to be modified as the result of a collision, do so elsewhere, such as by inspecting the list of collisions returned by moveWithCollisions().',
        returns = "(pd_collision_type) | (pd_collision_type)))",
        type = "function"
      },
      collisionsEnabled = {
        args = "()",
        description = "Returns the sprite’s `collisionsEnabled` flag.",
        returns = "(boolean)",
        type = "method"
      },
      copy = {
        args = "()",
        description = "Returns a copy of the caller.",
        returns = "(pd_sprite)",
        type = "method"
      },
      draw = {
        args = "nil | (fun(self: pd_sprite, x: number, y: number, width: number, height: number))",
        description = "If the sprite doesn’t have an image, the sprite’s draw function is called as needed to update the display. The rect passed in is the current dirty rect being updated by the display list. The rect coordinates passed in are relative to the sprite itself (i.e. x = 0, y = 0 refers to the top left corner of the sprite). Note that the callback is only called when the sprite is on screen and has a size specified via sprite:setSize() or sprite:setBounds().\nExample: Overriding the sprite draw method\n-- You can copy and paste this example directly as your main.lua file to see it in action\nimport \"CoreLibs/graphics\"\nimport \"CoreLibs/sprites\"\nlocal mySprite = playdate.graphics.sprite.new()\nmySprite:moveTo(200, 120)\n-- You MUST set a size first for anything to show up (either directly or by setting an image)\nmySprite:setSize(30, 30)\nmySprite:add()\n-- The x, y, width, and height arguments refer to the dirty rect being updated, NOT the sprite dimensions\nfunction mySprite:draw(x, y, width, height)\n    -- Custom draw methods gives you more flexibility over what's drawn, but with the added benefits of sprites\n    -- Here we're just modulating the circle radius over time\n    local spriteWidth, spriteHeight = self:getSize()\n    if not self.radius or self.radius > spriteWidth then\n        self.radius = 0\n    end\n    self.radius += 1\n    -- Drawing coordinates are relative to the sprite (e.g. (0, 0) is the top left of the sprite)\n    playdate.graphics.fillCircleAtPoint(spriteWidth / 2, spriteHeight / 2, self.radius)\nend\nfunction playdate.update()\n    -- Your custom draw method gets called here, but only if the sprite is dirty\n    playdate.graphics.sprite.update()\n    -- You might need to manually mark it dirty\n    mySprite:markDirty()\nend",
        returns = "(nil | (fun(self: pd_sprite, x: number, y: number, width: number, height: number)))",
        type = "function"
      },
      getBounds = {
        args = "()",
        description = "getBounds() returns multiple values (`x`, `y`, `width`, `height`).",
        returns = "((number, number, number, number))",
        type = "method"
      },
      getBoundsRect = {
        args = "()",
        description = "getBoundsRect() returns the sprite bounds as a playdate.geometry.rect object.",
        returns = "(pd_rect)",
        type = "method"
      },
      getCenter = {
        args = "()",
        description = "Returns multiple values (x, y) representing the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width.",
        returns = "((number, number))",
        type = "method"
      },
      getCenterPoint = {
        args = "()",
        description = "Returns a playdate.geometry.point representing the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width.",
        returns = "(pd_point)",
        type = "method"
      },
      getCollideBounds = {
        args = "()",
        description = "Returns the sprite’s collide rect as multiple values, (`x`, `y`, `width`, `height`).\nThis function return coordinates relative to the sprite itself; the sprite’s position has no bearing on these values.",
        returns = "((number, number, number, number))",
        type = "method"
      },
      getCollideRect = {
        args = "()",
        description = "Returns the sprite’s collide rect set with setCollideRect(). Return value is a playdate.geometry.rect.\nThis function return coordinates relative to the sprite itself; the sprite’s position has no bearing on these values.",
        returns = "(pd_rect)",
        type = "method"
      },
      getCollidesWithGroupsMask = {
        args = "()",
        description = "Returns the integer value of the sprite’s collision bitmask.",
        returns = "(integer)",
        type = "method"
      },
      getGroupMask = {
        args = "()",
        description = "getGroupMask() returns the integer value of the sprite’s group bitmask.",
        returns = "(integer)",
        type = "method"
      },
      getImage = {
        args = "()",
        description = "Returns the playdate.graphics.image object that was set with setImage().",
        returns = "(pd_image)",
        type = "method"
      },
      getImageFlip = {
        args = "()",
        description = "Returns one of the values listed at playdate.graphics.image:draw().",
        returns = "(pd_image)",
        type = "method"
      },
      getPosition = {
        args = "()",
        description = "Returns the sprite’s current x, y position as multiple values (`x`, `y`).",
        returns = "((number, number))",
        type = "method"
      },
      getRotation = {
        args = "()",
        description = "Returns the current rotation of the sprite.",
        returns = "(number)",
        type = "method"
      },
      getScale = {
        args = "()",
        description = "Returns multiple values `(xScale, yScale)`, the current scaling of the sprite.",
        returns = "((number, number))",
        type = "method"
      },
      getSize = {
        args = "()",
        description = "Returns multiple values `(width, height)`, the current size of the sprite.",
        returns = "((number, number))",
        type = "method"
      },
      getTag = {
        args = "()",
        description = "Returns the sprite’s tag, an integer value.",
        returns = "(integer)",
        type = "method"
      },
      getZIndex = {
        args = "()",
        description = "Returns the Z-index of the given sprite.",
        returns = "(number)",
        type = "method"
      },
      height = {
        description = "Can be used to directly read your sprite’s height.",
        returns = "(READONLY_number)",
        type = "value"
      },
      isOpaque = {
        args = "()",
        description = "Returns the sprite’s current opaque flag.",
        returns = "(boolean)",
        type = "method"
      },
      isVisible = {
        args = "()",
        description = "Returns a boolean value, true if the sprite is visible.",
        returns = "(boolean)",
        type = "method"
      },
      markDirty = {
        args = "()",
        description = "Marks the rect defined by the sprite’s current bounds as needing a redraw.",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      moveBy = {
        args = "(x: number, y: number))",
        description = "Moves the sprite by `x`, `y` pixels relative to its current position.",
        returns = "(fun(self: pd_sprite, x: number, y: number))",
        type = "method"
      },
      moveTo = {
        args = "(x: number, y: number))",
        description = "Moves the sprite and resets the bounds based on the image dimensions and center.",
        returns = "(fun(self: pd_sprite, x: number, y: number))",
        type = "method"
      },
      moveWithCollisions = {
        args = "(fun(self: pd_sprite, goalX: number, goalY: number): (number, number, pd_sprite_collision_info[], integer)) | (fun(self: pd_sprite, goalPoint: pd_point",
        description = "Moves the sprite towards `goalX`, `goalY` or `goalPoint` taking collisions into account, which means the sprite’s final position may not be the same as `goalX`, `goalY` or `goalPoint`.\nReturns `actualX`, `actualY`, `collisions`, `length`.\n`actualX`, `actualY`\nthe final position of the sprite. If no collisions occurred, this will be the same as `goalX`, `goalY`.\n`collisions`\nan array of userdata objects containing information about all collisions that occurred. Each item in the array contains values for the following indices:\n- `sprite`: The sprite being moved.\n- `other`: The sprite colliding with the sprite being moved.\n- `type`: The result of `collisionResponse`.\n- `overlaps`: Boolean. True if the sprite was overlapping `other` when the collision started. False if it didn’t overlap but tunneled through `other`.\n- `ti`: A number between 0 and 1 indicating how far along the movement to the goal the collision occurred.\n- `move`: playdate.geometry.vector2D. The difference between the original coordinates and the actual ones when the collision happened.\n- `normal`: playdate.geometry.vector2D. The collision normal; usually -1, 0, or 1 in `x` and `y`. Use this value to determine things like if your character is touching the ground.\n- `touch`: playdate.geometry.point. The coordinates where the sprite started touching `other`.\n- `spriteRect`: playdate.geometry.rect. The rectangle the sprite occupied when the touch happened.\n- `otherRect`: playdate.geometry.rect. The rectangle other occupied when the touch happened.\nIf the collision type was `playdate.graphics.sprite.kCollisionTypeBounce` the table also contains `bounce`, a playdate.geometry.point indicating the coordinates to which the sprite attempted to bounce (could be different than `actualX`, `actualY` if further collisions occurred).\nIf the collision type was `playdate.graphics.sprite.kCollisionTypeSlide` the table also contains `slide`, a playdate.geometry.point indicating the coordinates to which the sprite attempted to slide.\n`length`\nthe length of the collisions array, equal to `#collisions`\nNote that the collision info items are only valid until the next call of `moveWithCollisions` or `checkCollisions`. To save collision information for later, the data should be copied out of the collision info userdata object.\nSee also checkCollisions() to check for collisions without actually moving the sprite.\nExample: Using moveWithCollisions for a simple player collision example\n-- You can copy and paste this example directly as your main.lua file to see it in action\nimport \"CoreLibs/graphics\"\nimport \"CoreLibs/sprites\"\n-- Creating a tags object, to keep track of tags more easily\nTAGS = {\n    player = 1,\n    obstacle = 2,\n    coin = 3,\n    powerUp = 4\n}\n-- Creating a player sprite we can move around and collide things with\nlocal playerImage = playdate.graphics.image.new(20, 20)\nplaydate.graphics.pushContext(playerImage)\n    playdate.graphics.fillCircleInRect(0, 0, playerImage:getSize())\nplaydate.graphics.popContext()\nlocal playerSprite = playdate.graphics.sprite.new(playerImage)\n-- Setting a tag on the player, so we can check the tag to see if we're colliding against the player\nplayerSprite:setTag(TAGS.player)\nplayerSprite:moveTo(200, 120)\n-- Remember to set a collision rect, or this all doesn't work!\nplayerSprite:setCollideRect(0, 0, playerSprite:getSize())\nplayerSprite:add()\n-- Creating an obstacle sprite we can collide against\nlocal obstacleImage = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)\nlocal obstacleSprite = playdate.graphics.sprite.new(obstacleImage)\n-- Setting a tag for the obstacle as well\nobstacleSprite:setTag(TAGS.obstacle)\nobstacleSprite:moveTo(300, 120)\n-- Can't forget this!\nobstacleSprite:setCollideRect(0, 0, obstacleSprite:getSize())\nobstacleSprite:add()\nfunction playdate.update()\n    playdate.graphics.sprite.update()\n    -- Some simple movement code for the sake of demonstration\n    local moveSpeed = 3\n    local goalX, goalY = playerSprite.x, playerSprite.y\n    if playdate.buttonIsPressed(playdate.kButtonUp) then\n        goalY -= moveSpeed\n    elseif playdate.buttonIsPressed(playdate.kButtonDown) then\n        goalY += moveSpeed\n    elseif playdate.buttonIsPressed(playdate.kButtonLeft) then\n        goalX -= moveSpeed\n    elseif playdate.buttonIsPressed(playdate.kButtonRight) then\n        goalX += moveSpeed\n    end\n    -- Remember to use :moveWithCollisions(), and not :moveTo() or :moveBy(), or collisions won't happen!\n    -- To do a \"moveBy\" operation, sprite:moveBy(5, 5) == sprite:moveWithCollisions(sprite.x + 5, sprite.y + 5)\n    local actualX, actualY, collisions, numberOfCollisions = playerSprite:moveWithCollisions(goalX, goalY)\n    -- If we get into this loop, there was a collision\n    for i=1, numberOfCollisions do\n        -- This is getting data about one of things we're currently colliding with. Since we could\n        -- be colliding with multiple things at once, we have to handle each collision individually\n        local collision = collisions[i]\n        -- Always prints 'true', as the sprite property is the sprite being moved (in this case, the player)\n        print(collision.sprite == playerSprite)\n        -- Also prints 'true', as we set the tag on the player sprite to the player tag\n        print(collision.sprite:getTag() == TAGS.player)\n        -- This gets the actual sprite object we're colliding with\n        local collidedSprite = collision.other\n        local collisionTag = collidedSprite:getTag()\n        -- Since we set a tag on the obstacle, we can check if we're colliding with that\n        if collisionTag == TAGS.obstacle then\n            print(\"Collided with an obstacle!\")\n            -- We can use the collision normal to check which side we collided with\n            local collisionNormal = collision.normal\n            if collisionNormal.x == -1 then\n                print(\"Touched left side!\")\n            elseif collisionNormal.x == 1 then\n                print(\"Touched right side!\")\n            end\n            if collisionNormal.y == -1 then\n                print(\"Touched top!\")\n            elseif collisionNormal.y == 1 then\n                print(\"Touched bottom!\")\n            end\n        -- Handle some other collisions, like collecting a coin or a power up\n        elseif collisionTag == TAGS.coin then\n            print(\"Coin collected!\")\n        elseif collisionTag == TAGS.powerUp then\n            print(\"Powered up!\")\n        end\n    end\nend",
        returns = "((number, number, pd_sprite_collision_info[], integer)))",
        type = "function"
      },
      overlappingSprites = {
        args = "()",
        description = "Returns an array of sprites that have collide rects that are currently overlapping the calling sprite’s collide rect, taking the sprites' groups and collides-with masks into consideration.",
        returns = "(pd_sprite[])",
        type = "method"
      },
      remove = {
        args = "()",
        description = "Removes the given sprite from the display list.",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      removeAnimator = {
        args = "()",
        description = "Removes a playdate.graphics.animator assigned to the sprite",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      removeSprites = {
        args = "(spriteArray: pd_sprite[]))",
        description = "Removes all sprites in spriteArray from the global sprite list.",
        returns = "(fun(spriteArray: pd_sprite[]))",
        type = "function"
      },
      resetCollidesWithGroupsMask = {
        args = "()",
        description = "Resets the sprite’s collides-with-groups mask to 0x00000000.",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      resetGroupMask = {
        args = "()",
        description = "Resets the sprite’s group mask to 0x00000000.",
        returns = "(fun(self: pd_sprite))",
        type = "method"
      },
      setAnimator = {
        args = "(animator: pd_animator, moveWithCollisions?: boolean, removeOnCollision?: boolean))",
        description = "You must import `CoreLibs/sprites` to use the setAnimator method.\nsetAnimator assigns an playdate.graphics.animator to the sprite, which will cause the sprite to automatically update its position each frame while the animator is active.\n`animator` should be a playdate.graphics.animator created using playdate.geometry.points for its start and end values.\n`movesWithCollisions`, if provided and true will cause the sprite to move with collisions. A collision rect must be set on the sprite prior to passing true for this argument.\n`removeOnCollision`, if provided and true will cause the animator to be removed from the sprite when a collision occurs.\nsetAnimator should be called only after any custom update method has been set on the sprite.",
        returns = "(fun(self: pd_sprite, animator: pd_animator, moveWithCollisions?: boolean, removeOnCollision?: boolean | nil)",
        type = "method"
      },
      setBounds = {
        args = "(fun(self: pd_sprite, upper-left-x: number, upper-left-y: number, width: number, height: number)) | (fun(self: pd_sprite, rect: pd_rect))",
        description = "### Overload 1 ###\nsetBounds() positions and sizes the sprite, used for drawing and for calculating dirty rects. `upper-left-x` and `upper-left-y` are relative to the overall display coordinate system. (If an image is attached to the sprite, the size will be defined by that image, and not by the `width` and `height` parameters passed in to setBounds().)\nIn setBounds(), `x` and `y` always correspond to the upper left corner of the sprite, regardless of how a sprite’s center is defined. This makes it different from sprite:moveTo(), where `x` and `y` honor the sprite’s defined center (by default, at a point 50% along the sprite’s width and height.)\n### Overload 2 ###\nsetBounds(rect) sets the bounds of the sprite with a playdate.geometry.rect object.",
        returns = "((fun(self: pd_sprite, upper-left-x: number, upper-left-y: number, width: number, height: number)) | (fun(self: pd_sprite, rect: pd_rect)))",
        type = "function"
      },
      setCenter = {
        args = "(x: number, y: number))",
        description = "Sets the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width. Default is 0.5, 0.5 (the center of the sprite). This means that when you call :moveTo(x, y), the center of your sprite will be positioned at `x`, `y`. If you want x and y to represent the upper left corner of your sprite, specify the center as 0, 0.",
        returns = "(fun(self: pd_sprite, x: number, y: number))",
        type = "method"
      },
      setClipRect = {
        args = "(fun(self: pd_sprite, x: number, y: number, width: number, height: number)) | (fun(self: pd_sprite, rect: pd_rect))",
        description = "Sets the clipping rectangle for the sprite, using separate parameters or a playdate.geometry.rect object. Only areas within the rect will be drawn.",
        returns = "((fun(self: pd_sprite, x: number, y: number, width: number, height: number)) | (fun(self: pd_sprite, rect: pd_rect)))",
        type = "function"
      },
      setCollideRect = {
        args = "(fun(self: pd_sprite, x: number, y: number, width: number, height: number)) | (fun(self: pd_sprite, rect: pd_rect))",
        description = "setCollideRect() marks the area of the sprite, relative to its own internal coordinate system, to be checked for collisions with other sprites' collide rects. Note that the coordinate space is relative to the top-left corner of the bounds, regardless of where the sprite’s center/anchor is located.\nIf you want to set the sprite’s collide rect to be the same size as the sprite itself, you can write sprite:setCollideRect( 0, 0, sprite:getSize() ).\nsetCollideRect() must be invoked on a sprite in order to get it to participate in collisions.\nVery large sprites with very large collide rects should be avoided, as they will have a negative impact on performance and memory usage.",
        returns = "((fun(self: pd_sprite, x: number, y: number, width: number, height: number)) | (fun(self: pd_sprite, rect: pd_rect)))",
        type = "function"
      },
      setCollidesWithGroups = {
        args = "(groups: integer[]))",
        description = "Pass in a group number or an array of group numbers to specify which groups this sprite can collide with. Groups are numbered 1 through 32. Use setGroups() to specify which groups a sprite belongs to.\nAlternatively, you can specify group collision behavior with a bitmask by using setCollidesWithGroupsMask().",
        returns = "(fun(self: pd_sprite, groups: integer[]))",
        type = "method"
      },
      setCollidesWithGroupsMask = {
        args = "(mask: integer))",
        description = "Sets the sprite’s collides-with-groups bitmask, which is 32 bits. The mask specifies which other sprite groups this sprite can collide with. Sprites only collide if the moving sprite’s `collidesWithGroupsMask` matches at least one group of a potential collision sprite (i.e. a bitwise AND (&) between the moving sprite’s `collidesWithGroupsMask` and a potential collision sprite’s `groupMask` != zero) or if the moving sprite’s `collidesWithGroupsMask` and the other sprite’s `groupMask` are both set to 0x00000000 (the default values).\nFor large mask numbers, pass the number as a hex value, eg. 0xFFFFFFFF to work around limitations in Lua’s integer sizes.",
        returns = "(fun(self: pd_sprite, mask: integer))",
        type = "method"
      },
      setCollisionsEnabled = {
        args = "(flag: boolean))",
        description = "The sprite’s `collisionsEnabled` flag (defaults to true) can be set to false in order to temporarily keep a sprite from colliding with any other sprite.",
        returns = "(fun(self: pd_sprite, flag: boolean))",
        type = "method"
      },
      setGroupMask = {
        args = "(mask: integer))",
        description = "setGroupMask() sets the sprite’s group bitmask, which is 32 bits. In conjunction with the setCollidesWithGroupsMask() method, this controls which sprites can collide with each other.\nFor large group mask numbers, pass the number as a hex value, eg. 0xFFFFFFFF to work around limitations in Lua’s integer sizes.",
        returns = "(fun(self: pd_sprite, mask: integer))",
        type = "method"
      },
      setGroups = {
        args = "(groups: integer[]))",
        description = "Adds the sprite to one or more collision groups. A group is a collection of sprites that exhibit similar collision behavior. (An example: in Atari’s `Asteroids`, asteroid sprites would all be added to the same group, while the player’s spaceship might be in a different group.) Use setCollidesWithGroups() to define which groups a sprite should collide with.\nThere are 32 groups, each defined by the integer 1 through 32. To add a sprite to only groups 1 and 3, for example, call mySprite:setGroups({1, 3}).\nAlternatively, use setGroupMask() to set group membership via a bitmask.",
        returns = "(fun(self: pd_sprite, groups: integer[]))",
        type = "method"
      },
      setIgnoresDrawOffset = {
        args = "(flag: boolean))",
        description = "When set to `true`, the sprite will draw in screen coordinates, ignoring the currently-set `drawOffset`.\nThis only affects drawing, and should not be used on sprites being used for collisions, which will still happen in world-space.",
        returns = "(fun(self: pd_sprite, flag: boolean))",
        type = "method"
      },
      setImage = {
        args = "(image: pd_image, flip?: pd_image_flip, scale?: number, yscale?: number))",
        description = "Sets the sprite’s image to image, which should be an instance of playdate.graphics.image. The .flip_ argument is optional; see playdate.graphics.image:draw() for valid values. Optional scale arguments are also accepted. Unless disabled with playdate.graphics.sprite:setRedrawOnImageChange(), the sprite is automatically marked for redraw if the image isn’t the previous image.",
        returns = "(fun(self: pd_sprite, image: pd_image, flip?: pd_image_flip, scale?: number, yscale?: number | nil)",
        type = "method"
      },
      setImageDrawMode = {
        args = "(mode: pd_draw_mode))",
        description = "Sets the mode for drawing the bitmap. See playdate.graphics.setImageDrawMode(mode) for valid modes.",
        returns = "(fun(self: pd_sprite, mode: pd_draw_mode))",
        type = "method"
      },
      setImageFlip = {
        args = "(flip: pd_image_flip, flipCollideRect?: pd_rect))",
        description = "Flips the bitmap. See playdate.graphics.image:draw() for valid flip values.\nIf true is passed for the optional `flipCollideRect` argument, the sprite’s collideRect will be flipped as well.\nCalling setImage() will reset the sprite to its default, non-flipped orientation. So, if you call both setImage() and setImageFlip(), call setImage() first.",
        returns = "(fun(self: pd_sprite, flip: pd_image_flip, flipCollideRect?: pd_rect | nil)",
        type = "method"
      },
      setOpaque = {
        args = "(flag: boolean))",
        description = "Marking a sprite opaque tells the sprite system that it doesn’t need to draw anything underneath the sprite, since it will be overdrawn anyway. If you set an image without a mask/alpha channel on the sprite, it automatically sets the opaque flag.\nSetting a sprite to opaque can have performance benefits.",
        returns = "(fun(self: pd_sprite, flag: boolean))",
        type = "method"
      },
      setRedrawsOnImageChange = {
        args = "(flag: boolean))",
        description = "By default, sprites are automatically marked for redraw when their image is changed via playdate.graphics.sprite:setImage(). If disabled by calling this function with a `false` argument, playdate.graphics.sprite.addDirtyRect() can be used to mark the (potentially smaller) area of the screen that needs to be redrawn.",
        returns = "(fun(self: pd_sprite, flag: boolean))",
        type = "method"
      },
      setRotation = {
        args = "(angle: number, scale?: number, yScale?: number))",
        description = "Sets the rotation for the sprite, in degrees clockwise, with an optional scaling factor. If setImage() is called after this, the rotation and scale is applied to the new image. Only affects sprites that have an image set. This function should be used with discretion, as it’s likely to be slow on the hardware. Consider pre-rendering rotated images for your sprites instead.",
        returns = "(fun(self: pd_sprite, angle: number, scale?: number, yScale?: number | nil)",
        type = "method"
      },
      setScale = {
        args = "(scale: number, yScale?: number))",
        description = "Sets the scaling factor for the sprite, with an optional separate scaling for the y axis. If setImage() is called after this, the scale factor is applied to the new image. Only affects sprites that have an image set.",
        returns = "(fun(self: pd_sprite, scale: number, yScale?: number | nil)",
        type = "method"
      },
      setSize = {
        args = "(width: number, height: number))",
        description = "Sets the sprite’s size. The method has no effect if the sprite has an image set.",
        returns = "(fun(self: pd_sprite, width: number, height: number))",
        type = "method"
      },
      setStencilImage = {
        args = "(stencil: pd_image, tile?: boolean))",
        description = "Specifies a stencil image to be set on the frame buffer before the sprite is drawn. If `tile` is set, the the stencil will be tiled; in this case, the image width must be a multiple of 32 pixels.",
        returns = "(fun(self: pd_sprite, stencil: pd_image, tile?: boolean | nil)",
        type = "method"
      },
      setStencilPattern = {
        args = "(level: number, ditherType?: pd_dither_type))",
        description = "Sets the sprite’s stencil to a dither pattern specified by `level` and optional `ditherType` (defaults to playdate.graphics.image.kDitherTypeBayer8x8).",
        returns = "(fun(self: pd_sprite, level: number, ditherType?: pd_dither_type | nil)",
        type = "method"
      },
      setTag = {
        args = "(tag: integer))",
        description = "Sets the sprite’s tag, an integer value in the range of 0 to 255, useful for identifying sprites later, particularly when working with collisions.",
        returns = "(fun(self: pd_sprite, tag: integer))",
        type = "method"
      },
      setTilemap = {
        args = "(tilemap: pd_tilemap))",
        description = "Sets the sprite’s contents to the given tilemap. Useful if you want to automate drawing of your tilemap, especially if interleaved by depth with other sprites being drawn.",
        returns = "(fun(self: pd_sprite, tilemap: pd_tilemap))",
        type = "method"
      },
      setUpdatesEnabled = {
        args = "(flag: boolean))",
        description = "The sprite’s `updatesEnabled` flag (defaults to true) determines whether a sprite’s update() method will be called. By default, a sprite’s update method does nothing; however, you may choose to have your sprite do something on every frame by implementing an update method on your sprite instance, or implementing it in your sprite subclass.",
        returns = "(fun(self: pd_sprite, flag: boolean))",
        type = "method"
      },
      setVisible = {
        args = "(flag: boolean))",
        description = "Sprites that aren’t visible don’t get their draw() method called.",
        returns = "(fun(self: pd_sprite, flag: boolean))",
        type = "method"
      },
      setZIndex = {
        args = "(z: number))",
        description = "Sets the Z-index of the given sprite. Sprites with higher Z-indexes are drawn on top of those with lower Z-indexes. Valid values for `z` are in the range (-32768, 32767).",
        returns = "(fun(self: pd_sprite, z: number))",
        type = "method"
      },
      update = {
        args = "nil | (fun(self: pd_sprite))",
        description = "Called by playdate.graphics.sprite.update() (note the syntactic difference between the period and the colon) before sprites are drawn. Implementing :update() gives you the opportunity to perform some code upon every frame.\nThe update method will only be called on sprites that have had add() called on them, and have their updates enabled.\nBe careful not confuse sprite:update() with sprite.update(): the latter updates all sprites; the former updates just the sprite being invoked.\nExample: Overriding the sprite update method\nlocal mySprite = playdate.graphics.sprite.new()\nmySprite:moveTo(200, 120)\nmySprite:add() -- Sprite needs to be added to get drawn and updated\n-- mySprite:remove() will make it so the sprite stops getting drawn/updated\n-- Option 1: override the update method using an anonymous function\nmySprite.update = function(self)\n    print(\"This gets called every frame when I'm added to the display list\")\n    -- Manipulate sprite using \"self\"\n    print(self.x) -- Prints 200.0\n    print(self.y) -- Prints 120.0\nend\n-- Option 2: override the update method using a function stored in a variable\nlocal function mySpriteUpdate(self)\n    print(\"This gets called every frame when I'm added to the display list\")\n    -- Manipulate sprite using \"self\"\n    print(self.x) -- Prints 200.0\n    print(self.y) -- Prints 120.0\nend\nmySprite.update = mySpriteUpdate\n-- Option 3: override the update method by directly defining it\nfunction mySprite:update()\n    print(\"This gets called every frame when I'm added to the display list\")\n    -- Manipulate sprite using \"self\"\n    print(self.x) -- Prints 200.0\n    print(self.y) -- Prints 120.0\nend\nfunction playdate.update()\n    -- Your custom update method gets called here every frame if the sprite has been added\n    playdate.graphics.sprite.update()\nend\n-- VERY simplified psuedocode explanation of what's happening in sprite.update() (not real code)\nlocal displayList = {} -- Added sprites are kept track of in a list\nfunction playdate.graphics.sprite.update()\n    -- The display list is iterated over\n    for i=1, #displayList do\n        local sprite = displayList[i]\n        -- Checks if updates on the sprites are enabled\n        if sprite:updatesEnabled() then\n            -- The sprite update method is called\n            sprite:update()\n        end\n        ...\n        -- Redraw all of the dirty rects, handle collisions, etc.\n    end\nend",
        returns = "(nil | (fun(self: pd_sprite)))",
        type = "function"
      },
      updatesEnabled = {
        args = "()",
        description = "Returns a boolean value, true if updates are enabled on the sprite.",
        returns = "(boolean)",
        type = "method"
      },
      width = {
        description = "Can be used to directly read your sprite’s width.",
        returns = "(READONLY_number)",
        type = "value"
      },
      x = {
        description = "Can be used to directly read your sprite’s x position.",
        returns = "(READONLY_number)",
        type = "value"
      },
      y = {
        description = "Can be used to directly read your sprite’s y position.",
        returns = "(READONLY_number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_sprite_collision_info = {
    childs = {
      bounce = {
        returns = "(pd_point?)",
        type = "value"
      },
      move = {
        returns = "(pd_vector2D)",
        type = "value"
      },
      normal = {
        returns = "(pd_vector2D)",
        type = "value"
      },
      other = {
        returns = "(pd_sprite)",
        type = "value"
      },
      otherRect = {
        returns = "(pd_rect)",
        type = "value"
      },
      overlaps = {
        returns = "(boolean)",
        type = "value"
      },
      slide = {
        returns = "(pd_point?)",
        type = "value"
      },
      sprite = {
        returns = "(pd_sprite)",
        type = "value"
      },
      spriteRect = {
        returns = "(pd_rect)",
        type = "value"
      },
      ti = {
        returns = "(number)",
        type = "value"
      },
      touch = {
        returns = "(pd_point)",
        type = "value"
      },
      type = {
        returns = "(pd_collision_type)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_stats_table = {
    childs = {
      GC = {
        returns = "(number)",
        type = "value"
      },
      audio = {
        returns = "(number)",
        type = "value"
      },
      game = {
        returns = "(number)",
        type = "value"
      },
      idle = {
        returns = "(number)",
        type = "value"
      },
      kernel = {
        returns = "(number)",
        type = "value"
      },
      serial = {
        returns = "(number)",
        type = "value"
      },
      trace = {
        returns = "(number)",
        type = "value"
      },
      wifi = {
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_stroke_location = {
    type = "class"
  },
  pd_synth = {
    childs = {
      clearEnvelope = {
        args = "()",
        description = "Clears the synth’s envelope settings.",
        returns = "(fun(self: pd_synth))",
        type = "method"
      },
      copy = {
        args = "()",
        description = "Returns a copy of the given synth.",
        returns = "(pd_synth)",
        type = "method"
      },
      getEnvelope = {
        args = "()",
        description = "Returns the synth’s envelope as a playdate.sound.envelope object.",
        returns = "(pd_envelope)",
        type = "method"
      },
      getVolume = {
        args = "()",
        description = "Returns the current volume for the synth, a single value for mono sources or a pair of values (left, right) for stereo sources.\nVolume values are between 0.0 and 1.0.",
        returns = "(number)",
        type = "method"
      },
      isPlaying = {
        args = "()",
        description = "Returns true if the synth is still playing, including the release phase of the envelope.",
        returns = "(boolean)",
        type = "method"
      },
      noteOff = {
        args = "()",
        description = "Releases the note, if one is playing. The note will continue to be voiced through the release section of the synth’s envelope.",
        returns = "(fun(self: pd_synth))",
        type = "method"
      },
      playMIDINote = {
        args = "(note: string|number, volume?: number, length?: number, when?: number))",
        description = 'Identical to playNote but uses a note name like "C4", or MIDI note number (60=C4, 61=C#4, etc.). In the latter case, fractional values are allowed.',
        returns = "(fun(self: pd_synth, note: string|number, volume?: number, length?: number, when?: number | nil)",
        type = "method"
      },
      playNote = {
        args = "(pitch: number, volume?: number, length?: number, when?: number)",
        description = "Plays a note with the current waveform or sample.\n`pitch`: the pitch value is in Hertz. If a sample is playing, pitch=261.63 (C4) plays at normal speed\nin either function, a string like Db3 can be used instead of a number\n`volume`: 0 to 1, defaults to 1\n`length`: in seconds. If omitted, note will play until you call noteOff()\n`when`: seconds since the sound engine started (see playdate.sound.getCurrentTime). Defaults to the current time.\nThe function returns true if the synth was successfully added to the sound channel, otherwise false (i.e., if the channel is full).\nIf `pitch` is zero, this function calls noteOff() instead of potentially adding a non-zero sample, or DC offset, to the output.\nSynths currently only have a buffer of one note event. If you call `playNote()` while another note is waiting to play, it will replace that note. To create a sequence of notes to play over a period of time, see playdate.sound.sequence.",
        returns = "(boolean)",
        type = "method"
      },
      setADSR = {
        args = "(attack: number, decay: number, sustain: number, release: number))",
        description = "Sets the attack time, decay time, sustain level, and release time for the sound envelope, and optionally the curvature.",
        returns = "(fun(self: pd_synth, attack: number, decay: number, sustain: number, release: number))",
        type = "method"
      },
      setAmplitudeMod = {
        args = "(signal: pd_signal?))",
        description = "Sets the signal to use as the amplitude modulator. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_synth, signal: pd_signal? | nil)",
        type = "method"
      },
      setAttack = {
        args = "(time: number))",
        description = "Sets the attack time, in seconds.",
        returns = "(fun(self: pd_synth, time: number))",
        type = "method"
      },
      setDecay = {
        args = "(time: number))",
        description = "Sets the decay time, in seconds.",
        returns = "(fun(self: pd_synth, time: number))",
        type = "method"
      },
      setEnvelopeCurvature = {
        args = "(amount: number))",
        description = "Smoothly changes the envelope’s shape from linear (amount=0) to exponential (amount=1).",
        returns = "(fun(self: pd_synth, amount: number))",
        type = "method"
      },
      setFinishCallback = {
        args = "(function: fun()))",
        description = "Sets a function to be called when the synth stops playing.",
        returns = "(fun(self: pd_synth, function: fun()))",
        type = "method"
      },
      setFrequencyMod = {
        args = "(signal: pd_signal?))",
        description = "Sets the signal to use as the frequency modulator. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_synth, signal: pd_signal? | nil)",
        type = "method"
      },
      setLegato = {
        args = "(flag: boolean))",
        description = "Sets whether to use legato phrasing for the synth. If the legato flag is set and a new note starts while a previous note is still playing, the synth’s envelope remains in the sustain phase instead of starting a new attack.",
        returns = "(fun(self: pd_synth, flag: boolean))",
        type = "method"
      },
      setParameter = {
        args = "(parameter: integer, value: number))",
        description = "Sets the parameter at (1-based) position `num` to the given value. Unless otherwise specified, `value` ranges from 0 to 1.",
        returns = "(fun(self: pd_synth, parameter: integer, value: number))",
        type = "method"
      },
      setParameterMod = {
        args = "(parameter: number, signal: pd_signal?))",
        description = "Sets the signal to modulate the parameter. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_synth, parameter: number, signal: pd_signal? | nil)",
        type = "method"
      },
      setRelease = {
        args = "(time: number))",
        description = "Sets the release time, in seconds.",
        returns = "(fun(self: pd_synth, time: number))",
        type = "method"
      },
      setSustain = {
        args = "(level: number))",
        description = "Sets the sustain level, as a proportion of the total level (0.0 to 1.0).",
        returns = "(fun(self: pd_synth, level: number))",
        type = "method"
      },
      setVolume = {
        args = "(left: number, right?: number))",
        description = "Sets the synth volume. If a single value is passed in, sets both left side and right side volume to the given value. If two values are given, volumes are set separately.\nVolume values are between 0.0 and 1.0.",
        returns = "(fun(self: pd_synth, left: number, right?: number | nil)",
        type = "method"
      },
      setWaveform = {
        args = "(waveform: pd_waveform|pd_sample))",
        description = "Sets the waveform or Sample the synth plays. If a sample is given, its data must be uncompressed PCM, not ADPCM. Otherwise `waveform` should be one of the following constants:\n`playdate.sound.kWaveSine`\n`playdate.sound.kWaveSquare`\n`playdate.sound.kWaveSawtooth`\n`playdate.sound.kWaveTriangle`\n`playdate.sound.kWaveNoise`\n`playdate.sound.kWavePOPhase`\n`playdate.sound.kWavePODigital`\n`playdate.sound.kWavePOVosim`",
        returns = "(fun(self: pd_synth, waveform: pd_waveform|pd_sample))",
        type = "method"
      },
      setWavetable = {
        args = "(sample: pd_sample, samplesize: integer, xsize: integer, ysize?: integer))",
        description = 'Sets a wavetable for the synth to play. Sample data must be 16-bit mono uncompressed. samplesize is the number of samples in each waveform "cell" in the table and must be a power of 2. xsize is the number of cells across the wavetable. If the wavetable is two-dimensional, ysize gives the number of cells in the y direction.\nThe synth’s "position" in the wavetable is set manually with setParameter() or automated with setParameterModulator(). In some cases it’s easier to use a parameter that matches the waveform position in the table, in others (notably when using envelopes and lfos) it’s more convenient to use a 0-1 scale, so there’s some redundancy here. Parameters are\n1: x position, values are from 0 to the table width\n2: x position, values are from 0 to 1, parameter is scaled up to table width\nFor 2-D tables (rowwidth > 0):\n3: y position, values are from 0 to the table height\n4: y position, values are from 0 to 1, parameter is scaled up to table height',
        returns = "(fun(self: pd_synth, sample: pd_sample, samplesize: integer, xsize: integer, ysize?: integer | nil)",
        type = "method"
      },
      stop = {
        args = "()",
        description = "Stops the synth immediately, without playing the release part of the envelope.",
        returns = "(fun(self: pd_synth))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_text_alignment = {
    type = "class"
  },
  pd_tilemap = {
    childs = {
      draw = {
        args = "(fun(self: pd_tilemap, x: number, y: number, sourceRect?: pd_rect)) | (fun(self: pd_tilemap, x: number, y: number, rx?: number, ry?: number, rw?: number, rh?: number))",
        description = "Draws the tile map at screen coordinate (`x`, `y`).\n`sourceRect`, if specified, will cause only the part of the tilemap within sourceRect to be drawn. `sourceRect` should be relative to the tilemap’s bounds and can be a playdate.geometry.rect or four integers, (`x`, `y`, `w`, `h`), representing the rect.",
        returns = "((fun(self: pd_tilemap, x: number, y: number, sourceRect?: pd_rect)) | (fun(self: pd_tilemap, x: number, y: number, rx?: number, ry?: number, rw?: number, rh?: number) | nil)",
        type = "function"
      },
      drawIgnoringOffset = {
        args = "(fun(self: pd_tilemap, x: number, y: number, sourceRect?: pd_rect)) | (fun(self: pd_tilemap, x: number, y: number, rx?: number, ry?: number, rw?: number, rh?: number))",
        description = "Draws the tilemap ignoring the currently-set drawOffset.",
        returns = "((fun(self: pd_tilemap, x: number, y: number, sourceRect?: pd_rect)) | (fun(self: pd_tilemap, x: number, y: number, rx?: number, ry?: number, rw?: number, rh?: number) | nil)",
        type = "function"
      },
      getCollisionRects = {
        args = "(emptyIDs: integer[])",
        description = 'This function returns an array of playdate.geometry.rect objects that describe the areas of the tilemap that should trigger collisions. You can also think of them as the "impassable" rects of your tilemap. These rects will be in tilemap coordinates, not pixel coordinates.\n`emptyIDs` is an array that contains the tile IDs of "empty" (or "passable") tiles in the tilemap — in other words, tile IDs that should not trigger a collision. Tiles with default IDs of 0 are treated as empty by default, so you do not need to include 0 in the array.\nFor example, if you have a tilemap describing terrain, where tile ID 1 represents grass the player can walk over, and tile ID 2 represents mountains that the player can’t cross, you’d pass an array containing just the value 1. You’ll get a back an array of a minimal number of rects describing the areas where there are mountain tiles.\nYou can then pass each of those rects into playdate.graphics.sprite.addEmptyCollisionSprite() to add an empty (invisible) sprite into the scene for the built-in collision detection methods. In this example, collide rects would be added around mountain tiles but not grass tiles.\nAlternatively, instead of calling getCollisionRects() at all, you can use the convenience function playdate.graphics.sprite.addWallSprites(), which is effectively a shortcut for calling getCollisionRects() and passing all the resulting rects to addEmptyCollisionSprite().',
        returns = "(pd_rect)",
        type = "method"
      },
      getPixelSize = {
        args = "()",
        description = "Returns the size of the tilemap in pixels; that is, the size of the image multiplied by the number of rows and columns in the map. Returns multiple values (`width`, `height`).",
        returns = "((number, number))",
        type = "method"
      },
      getSize = {
        args = "()",
        description = "Returns the size of the tile map, in tiles, as a pair, (`width`, `height`).",
        returns = "((number, number))",
        type = "method"
      },
      getTileAtPosition = {
        args = "(x: number, y: number)",
        description = "Returns the image index of the tile at the given `x` and `y` coordinate. If `x` or `y` is out of bounds, returns nil.\nTilemaps and imagetables, like Lua arrays, are 1-based, not 0-based. tilemap:getTileAtPosition(1, 1) will return the index of the top-leftmost tile.",
        returns = "(integer | nil)",
        type = "method"
      },
      getTileSize = {
        args = "()",
        description = "Returns multiple values (`width`, `height`), the pixel width and height of an individual tile.",
        returns = "((number, number))",
        type = "method"
      },
      getTiles = {
        args = "()",
        description = "Returns `data`, `width`\n`data` is a flat, one-dimensional array-like table containing index values to the tilemap’s imagetable.\n`width` is the width of the tile map, in number of tiles.",
        returns = "((integer[], integer))",
        type = "method"
      },
      setImageTable = {
        args = "(table: pd_imagetable))",
        description = "Sets the tilemap’s playdate.graphics.imagetable to `table`, a playdate.graphics.imagetable.",
        returns = "(fun(self: pd_tilemap, table: pd_imagetable))",
        type = "method"
      },
      setSize = {
        args = "(width: number, height: number))",
        description = "Sets the tilemap’s width and height, in number of tiles.",
        returns = "(fun(self: pd_tilemap, width: number, height: number))",
        type = "method"
      },
      setTileAtPosition = {
        args = "(x: number, y: number, index: integer))",
        description = "Sets the index of the tile at tilemap position (`x`, `y`). `index` is the (1-based) index of the image in the tilemap’s playdate.graphics.imagetable.\nTilemaps and imagetables, like Lua arrays, are 1-based, not 0-based. tilemap:setTileAtPosition(1, 1, 2) will set the index of the tile in the top-leftmost position to 2.",
        returns = "(fun(self: pd_tilemap, x: number, y: number, index: integer))",
        type = "method"
      },
      setTiles = {
        args = "(data: integer[], width: number))",
        description = "Sets the tilemap’s width to `width`, then populates the tilemap with `data`, which should be a flat, one-dimensional array-like table containing index values to the tilemap’s imagetable.",
        returns = "(fun(self: pd_tilemap, data: integer[], width: number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_time_table = {
    childs = {
      day = {
        returns = "(number)",
        type = "value"
      },
      hour = {
        returns = "(number)",
        type = "value"
      },
      millisecond = {
        returns = "(number)",
        type = "value"
      },
      minute = {
        returns = "(number)",
        type = "value"
      },
      month = {
        returns = "(number)",
        type = "value"
      },
      second = {
        returns = "(number)",
        type = "value"
      },
      weekday = {
        returns = "(number)",
        type = "value"
      },
      year = {
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_timer = {
    childs = {
      currentTime = {
        description = "The number of milliseconds the timer has been running. Read-only.",
        returns = "(READONLY_number)",
        type = "value"
      },
      delay = {
        description = "Number of milliseconds to wait before starting the timer.",
        returns = "(number)",
        type = "value"
      },
      discardOnCompletion = {
        description = "If true, the timer is discarded once it is complete. Defaults to true.",
        returns = "(boolean)",
        type = "value"
      },
      duration = {
        description = "The number of milliseconds for which the timer will run.",
        returns = "(number)",
        type = "value"
      },
      easingAmplitude = {
        description = "For easing functions that take additional amplitude and period arguments (such as `inOutElastic`), set these to the desired values.",
        returns = "(number)",
        type = "value"
      },
      easingFunction = {
        args = "(fun(number, number, number, number",
        description = "The function used to calculate `value`. The function should be of the form `function(t, b, c, d)`, where `t` is elapsed time, `b` is the beginning value, `c` is the change (or end value - start value), and `d` is the duration. Many such functions are available in playdate.easingFunctions.",
        returns = "(number))",
        type = "function"
      },
      easingPeriod = {
        description = "For easing functions that take additional amplitude and period arguments (such as `inOutElastic`), set these to the desired values.",
        returns = "(number)",
        type = "value"
      },
      endValue = {
        description = "End value used when calculating `value`.",
        returns = "(number)",
        type = "value"
      },
      pause = {
        args = "()",
        description = "Pauses a timer. (There is no need to call :start() on a newly-instantiated timer: timers start automatically.)",
        returns = "(fun(self: pd_timer))",
        type = "method"
      },
      paused = {
        description = "If true, the timer will be paused. The update callback will not be called when the timer is paused. Can be set directly, or by using playdate.timer:pause() and playdate.timer:start(). Defaults to false.",
        returns = "(boolean)",
        type = "value"
      },
      remove = {
        args = "()",
        description = "Removes this timer from the list of timers. This happens automatically when a non-repeating timer reaches its end, but you can use this method to dispose of timers manually.\nNote that timers do not actually get removed until the next invocation of playdate.timer.updateTimers().",
        returns = "(fun(self: pd_timer))",
        type = "method"
      },
      repeats = {
        description = "If true, the timer starts over from the beginning when it completes. Defaults to false.",
        returns = "(boolean)",
        type = "value"
      },
      reset = {
        args = "()",
        description = "Resets a timer to its initial values.",
        returns = "(fun(self: pd_timer))",
        type = "method"
      },
      reverseEasingFunction = {
        args = "(fun(number, number, number, number",
        description = "Set to provide an easing function to be used for the reverse portion of the timer. The function should be of the form `function(t, b, c, d)`, where `t` is elapsed time, `b` is the beginning value, `c` is the change (or end value - start value), and `d` is the duration. Many such functions are available in playdate.easingFunctions.",
        returns = "(number))",
        type = "function"
      },
      reverses = {
        description = "If true, the timer plays in reverse once it has completed. The time to complete both the forward and reverse will be `duration` x 2. Defaults to false.\nPlease note that `currentTime` will restart at 0 and count up to `duration` again when the reverse timer starts, but `value` will be calculated in reverse, from `endValue` to `startValue`. The same easing function (as opposed to the inverse of the easing function) will be used for the reverse timer unless an alternate is provided by setting `reverseEasingFunction`.",
        returns = "(boolean)",
        type = "value"
      },
      start = {
        args = "()",
        description = "Resumes a previously paused timer. There is no need to call :start() on a newly-instantiated timer: timers start automatically.",
        returns = "(fun(self: pd_timer))",
        type = "method"
      },
      startValue = {
        description = "Start value used when calculating `value`.",
        returns = "(number)",
        type = "value"
      },
      timeLeft = {
        description = "The number of milliseconds remaining in the timer. Read-only.",
        returns = "(READONLY_number)",
        type = "value"
      },
      timerEndedArgs = {
        description = "For repeating timers, this function will be called each time the timer completes, before it starts again.\nAn array-style table of values that will be passed to the `timerEndedCallback` function.",
        returns = "(any[])",
        type = "value"
      },
      timerEndedCallback = {
        args = "nil | (fun())",
        description = 'A Function of the form `function(timer)` or `function(...)` where "..." corresponds to the values in the table assigned to `timerEndedArgs`. Called when the timer has completed.',
        returns = "(nil | (fun()))",
        type = "function"
      },
      updateCallback = {
        args = "nil | (fun())",
        description = "A callback function that will be called on every frame (every time `timer.updateAll()` is called). If the timer was created with arguments, those will be passed as arguments to the function provided. Otherwise, the timer is passed as the single argument.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      value = {
        description = "Current value calculated from the start and end values, the time elapsed, and the easing function.",
        returns = "(number)",
        type = "value"
      }
    },
    type = "class"
  },
  pd_track = {
    childs = {
      addControlSignal = {
        args = "(s: pd_controlsignal))",
        description = "Adds a playdate.sound.controlsignal object to the track. Note that the signal must be assigned to a modulation input for it to have any audible effect. The input can be anywhere in the sound engine—​it’s not required to belong to the track in any way.",
        returns = "(fun(self: pd_track, s: pd_controlsignal))",
        type = "method"
      },
      addNote = {
        args = "(fun(self: pd_track, step: integer, note: string|number, length: number, velocity?: number)) | (fun(self: pd_track, table: pd_note_table))",
        description = 'Adds a single note event to the track, letting you specify step, note, length, and velocity directly. The second format allows you to pack them into a table, using the format returned by getNotes(). The note argument can be a MIDI note number or a note name like "Db3". length is the length of the note in steps, not time—​that is, it follows the sequence’s tempo. The default velocity is 1.0.\nSee setNotes() for the ability to add more than one note at a time.',
        returns = "((fun(self: pd_track, step: integer, note: string|number, length: number, velocity?: number)) | (fun(self: pd_track, table: pd_note_table) | nil)",
        type = "function"
      },
      clearNotes = {
        args = "()",
        description = "Clears all notes from the track.",
        returns = "(fun(self: pd_track))",
        type = "method"
      },
      getControlSignals = {
        args = "()",
        description = "Returns an array of playdate.sound.controlsignal objects assigned to this track.",
        returns = "(pd_controlsignal[])",
        type = "method"
      },
      getInstrument = {
        args = "()",
        description = "Gets the playdate.sound.instrument that this track plays.",
        returns = "(pd_instrument)",
        type = "method"
      },
      getLength = {
        args = "()",
        description = "Returns the length, in steps, of the track—​that is, the step where the last note in the track ends.",
        returns = "(number)",
        type = "method"
      },
      getNotes = {
        args = "(step?: integer, endstep?: integer)",
        description = "Returns an array of tables representing the note events in the track.\nThe tables contain values for keys step, note, length, and velocity. If step is given, the function returns only the notes at that step; if both step and endstep are set, it returns the notes between the two steps (including notes at endstep). n.b. The note field in the event tables is always a MIDI note number value, even if the note was added using the string notation.",
        returns = "(pd_note_table[])",
        type = "method"
      },
      getNotesActive = {
        args = "()",
        description = "Returns the current number of notes active in the track.",
        returns = "(integer)",
        type = "method"
      },
      getPolyphony = {
        args = "()",
        description = "Returns the maximum number of notes simultaneously active in the track. (Known bug: this currently only works for midi files)",
        returns = "(integer)",
        type = "method"
      },
      removeNote = {
        args = "(step: integer, note: string|number))",
        description = "Removes the note event at `step` playing `note`.",
        returns = "(fun(self: pd_track, step: integer, note: string|number))",
        type = "method"
      },
      setInstrument = {
        args = "(inst: pd_instrument|pd_synth))",
        description = "Sets the playdate.sound.instrument that this track plays. If inst is a playdate.sound.synth, the function creates an instrument for the synth.",
        returns = "(fun(self: pd_track, inst: pd_instrument|pd_synth))",
        type = "method"
      },
      setMuted = {
        args = "(flag: boolean))",
        description = "Mutes or unmutes the track.",
        returns = "(fun(self: pd_track, flag: boolean))",
        type = "method"
      },
      setNotes = {
        args = "(list: pd_note_table[]))",
        description = "Set multiple notes at once, each array element should be a table containing values for the keys The tables contain values for keys step, note, length, and velocity.",
        returns = "(fun(self: pd_track, list: pd_note_table[]))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_twopolefilter = {
    childs = {
      setFrequency = {
        args = "(f: number))",
        description = "Sets the center frequency (in Hz) of the filter to `f`.",
        returns = "(fun(self: pd_twopolefilter, f: number))",
        type = "method"
      },
      setFrequencyMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the filter frequency. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_twopolefilter, signal: pd_signal? | nil)",
        type = "method"
      },
      setGain = {
        args = "(g: number))",
        description = "Sets the gain of the filter to `g`. Gain is only used in PEQ and shelf type filters.",
        returns = "(fun(self: pd_twopolefilter, g: number))",
        type = "method"
      },
      setMix = {
        args = "(level: number))",
        description = "Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.",
        returns = "(fun(self: pd_twopolefilter, level: number))",
        type = "method"
      },
      setMixMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the mix level. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_twopolefilter, signal: pd_signal? | nil)",
        type = "method"
      },
      setResonance = {
        args = "(r: number))",
        description = "Sets the resonance of the filter to `r`. Valid values are in the range 0-1. This parameter has no effect on shelf type filters.",
        returns = "(fun(self: pd_twopolefilter, r: number))",
        type = "method"
      },
      setResonanceMod = {
        args = "(signal: pd_signal?))",
        description = "Sets a signal to modulate the filter resonance. Set to `nil` to clear the modulator.",
        returns = "(fun(self: pd_twopolefilter, signal: pd_signal? | nil)",
        type = "method"
      },
      setType = {
        args = "(type: pd_sound_filter))",
        description = "Sets the type of the filter to `type`.",
        returns = "(fun(self: pd_twopolefilter, type: pd_sound_filter))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_vector2D = {
    childs = {
      addVector = {
        args = "(v: pd_vector2D))",
        description = "Modifies the caller by adding vector `v`.",
        returns = "(fun(self: pd_vector2D, v: pd_vector2D))",
        type = "method"
      },
      angleBetween = {
        args = "(v: pd_vector2D)",
        description = "Returns the angle between the caller and the vector `v`.",
        returns = "(number)",
        type = "method"
      },
      copy = {
        args = "()",
        description = "Returns a new copy of the vector2D.",
        returns = "(pd_vector2D)",
        type = "method"
      },
      dotProduct = {
        args = "(v: pd_vector2D)",
        description = "Returns the dot product of the caller and the vector `v`.",
        returns = "(number)",
        type = "method"
      },
      dx = {
        description = "Returns the vector formed by negating the components of vector `v`.\nReturns the vector formed by adding vector `v2` to vector `v1`.\nReturns the vector formed by subtracting vector `v2` from vector `v1`.\nReturns the vector `v1` scaled by `s`.\nReturns the dot product of the two vectors.\nReturns the vector transformed by transform `t`.\nReturns the vector divided by scalar `s`.\nYou can directly read or write `dx`, or `dy` values to a vector2D.",
        returns = "(number)",
        type = "value"
      },
      dy = {
        description = "You can directly read or write `dx`, or `dy` values to a vector2D.",
        returns = "(number)",
        type = "value"
      },
      leftNormal = {
        args = "()",
        description = "Returns a vector that is the left normal of the caller.",
        returns = "(pd_vector2D)",
        type = "method"
      },
      magnitude = {
        args = "()",
        description = "Returns the magnitude of the caller.",
        returns = "(number)",
        type = "method"
      },
      magnitudeSquared = {
        args = "()",
        description = "Returns the square of the magnitude of the caller.",
        returns = "(number)",
        type = "method"
      },
      normalize = {
        args = "()",
        description = "Modifies the caller by normalizing it so that its length is 1. If the vector is (0,0), the vector is unchanged.",
        returns = "(fun(self: pd_vector2D))",
        type = "method"
      },
      normalized = {
        args = "()",
        description = "Returns a new vector by normalizing the given vector.",
        returns = "(pd_vector2D)",
        type = "method"
      },
      projectAlong = {
        args = "(v: pd_vector2D))",
        description = "Modifies the caller by projecting it along the vector `v`.",
        returns = "(fun(self: pd_vector2D, v: pd_vector2D))",
        type = "method"
      },
      projectedAlong = {
        args = "(v: pd_vector2D)",
        description = "Returns a new vector created by projecting the given vector along the vector `v`.",
        returns = "(pd_vector2D)",
        type = "method"
      },
      rightNormal = {
        args = "()",
        description = "Returns a vector that is the right normal of the caller.",
        returns = "(pd_vector2D)",
        type = "method"
      },
      scale = {
        args = "(s: number))",
        description = "Modifies the caller, scaling it by amount `s`.",
        returns = "(fun(self: pd_vector2D, s: number))",
        type = "method"
      },
      scaledBy = {
        args = "(s: number)",
        description = "Returns the given vector scaled by `s`.",
        returns = "(pd_vector2D)",
        type = "method"
      },
      unpack = {
        args = "()",
        description = "Returns the values `dx, dy`.",
        returns = "((number, number))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_video = {
    childs = {
      getContext = {
        args = "()",
        description = "Returns the image into which the video will be rendered, creating it if needed.",
        returns = "(pd_image)",
        type = "method"
      },
      getFrameCount = {
        args = "()",
        description = "Returns the number of frames in the video.",
        returns = "(number)",
        type = "method"
      },
      getFrameRate = {
        args = "()",
        description = "Returns the number of frames per second of the video source. This number is simply for record-keeping, it is not used internally—​the game code is responsible for figuring out which frame to show when.",
        returns = "(number)",
        type = "method"
      },
      getSize = {
        args = "()",
        description = "Returns the width and height of the video as multiple vlaues (`width`, `height`).",
        returns = "((number, number))",
        type = "method"
      },
      renderFrame = {
        args = "(number: integer))",
        description = "Draws the given frame into the video’s render context.",
        returns = "(fun(self: pd_video, number: integer))",
        type = "method"
      },
      setContext = {
        args = "(image: pd_image))",
        description = "Sets the given image to the video render context. Future video:renderFrame() calls will draw into this image.",
        returns = "(fun(self: pd_video, image: pd_image))",
        type = "method"
      },
      useScreenContext = {
        args = "()",
        description = "Sets the display framebuffer as the video’s render context.",
        returns = "(fun(self: pd_video))",
        type = "method"
      }
    },
    type = "class"
  },
  pd_waveform = {
    type = "class"
  },
  pd_wrap_mode = {
    type = "class"
  },
  playdate = {
    childs = {
      AButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the A Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      AButtonHeld = {
        args = "nil | (fun())",
        description = "Called after the A Button is held down for one second. This can be used for secondary actions (e.g., displaying a game world map, changing weapons).",
        returns = "(nil | (fun()))",
        type = "function"
      },
      AButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the A Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      BButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the B Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      BButtonHeld = {
        args = "nil | (fun())",
        description = "Called after the B Button is held down for one second. This can be used for secondary actions (e.g., displaying a game world map, changing weapons).",
        returns = "(nil | (fun()))",
        type = "function"
      },
      BButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the B Button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      GMTTimeFromEpoch = {
        args = "(seconds: number, milliseconds: number)",
        description = "Converts the epoch to a GMT date and time table, in the same format as the table returned by playdate.getTime().",
        returns = "(pd_time_table)",
        type = "function"
      },
      accelerometerIsRunning = {
        args = "()",
        description = "Returns true if the accelerometer is currently running.",
        returns = "(boolean)",
        type = "function"
      },
      apiVersion = {
        args = "()",
        description = "Returns two values, the current API version of the Playdate runtime and the minimum API version supported by the runtime.",
        returns = "((number, number))",
        type = "function"
      },
      argv = {
        description = "If the simulator is launched from the command line, any extra arguments passed there are available in the playdate.argv array.",
        returns = "(string[])",
        type = "value"
      },
      buttonIsPressed = {
        args = "(button: pd_button)",
        description = 'Returns true if `button` is currently being pressed.\n`button` should be one of the constants:\n`playdate.kButtonA`\n`playdate.kButtonB`\n`playdate.kButtonUp`\n`playdate.kButtonDown`\n`playdate.kButtonLeft`\n`playdate.kButtonRight`\nOr one of the strings "a", "b", "up", "down", "left", "right".',
        returns = "(boolean)",
        type = "function"
      },
      buttonJustPressed = {
        args = "(button: pd_button)",
        description = 'Returns true for `just one update cycle` if `button` was pressed. buttonJustPressed will not return true again until the button is released and pressed again. This is useful for, say, a player "jump" action, so the jump action is taken only once and not on every single update.\n`button` should be one of the constants listed in playdate.buttonIsPressed()',
        returns = "(boolean)",
        type = "function"
      },
      buttonJustReleased = {
        args = "(button: pd_button)",
        description = "Returns true for `just one update cycle` if `button` was released. buttonJustReleased will not return true again until the button is pressed and released again.\n`button` should be one of the constants listed in playdate.buttonIsPressed()",
        returns = "(boolean)",
        type = "function"
      },
      clearConsole = {
        args = "())",
        description = "Clears the simulator console.",
        returns = "(fun())",
        type = "function"
      },
      crankDocked = {
        args = "nil | (fun())",
        description = "This function, if defined, is called when the crank is docked.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      crankUndocked = {
        args = "nil | (fun())",
        description = "This function, if defined, is called when the crank is undocked.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      cranked = {
        args = "nil | (fun(change: number, acceleratedChange: number))",
        description = "For playdate.cranked(), `change` is the angle change in degrees. `acceleratedChange` is `change` multiplied by a value that increases as the crank moves faster, similar to the way mouse acceleration works. Negative values are anti-clockwise.",
        returns = "(nil | (fun(change: number, acceleratedChange: number)))",
        type = "function"
      },
      datastore = {
        childs = {
          delete = {
            args = "(filename?: string)",
            description = 'Deletes the specified datastore file. The default file name is "data". Returns false if the datastore file could not be deleted.',
            returns = "(boolean)",
            type = "function"
          },
          read = {
            args = "(filename?: string)",
            description = 'Returns a table instantiated with the data in the JSON-encoded file you specify. (The .json extension should be omitted.) The default file name is "data". If no file is found, this function returns nil.',
            returns = "(table)",
            type = "function"
          },
          readImage = {
            args = "(path: string))",
            description = 'Reads a playdate.graphics.image from a file in the data folder. If `path` doesn’t contain a folder name, the image is searched for in a folder named "images".\nreadImage() can only load compiled pdi files. (writeImage() by default creates compiled pdi files.)',
            returns = "(fun(path: string))",
            type = "function"
          },
          write = {
            args = "(table: table, filename?: string, pretty-print?: boolean))",
            description = 'Encodes the given table into the named file. (The .json extension should be omitted from the file name.) The default file name is "data". If `pretty-print` is true, the JSON will be nicely formatted.',
            returns = "(fun(table: table, filename?: string, pretty-print?: boolean | nil)",
            type = "function"
          },
          writeImage = {
            args = "(image: pd_image, path: string))",
            description = 'Saves a playdate.graphics.image to a file. If `path` doesn’t contain a folder name, the image is stored in a folder named "images".\nBy default, this method writes out a PDI file, a custom image format used by Playdate that can be read back in using readImage(). If you want to write out a GIF file, append a .gif extension to your `path`.\nBecause writeImage() doesn’t currently support GIF transparency, if you attempt to write a GIF from an image buffer you instantiated, you must call playdate.graphics.image.new( `width, height, bgcolor` ) with `bgcolor` set to playdate.graphics.kColorWhite or playdate.graphics.kColorBlack, otherwise your image will render improperly to the file.',
            returns = "(fun(image: pd_image, path: string))",
            type = "function"
          }
        },
        type = "class"
      },
      debugDraw = {
        args = "nil | (fun())",
        description = "Called immediately after playdate.update(), any drawing performed during this callback is overlaid on the display in 50% transparent red (or another color selected with playdate.setDebugDrawColor()).\nWhite pixels are drawn in the debugDrawColor. Black pixels are transparent.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      deviceDidUnlock = {
        args = "nil | (fun())",
        description = "If your game is running on the Playdate when the device is unlocked, this function will be called.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      deviceWillLock = {
        args = "nil | (fun())",
        description = "If your game is running on the Playdate when the device is locked, this function will be called. Implementing this function allows your game to take special action when the Playdate is locked, e.g., saving state.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      deviceWillSleep = {
        args = "nil | (fun())",
        description = "Called before the device goes to low-power sleep mode because of a low battery.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      display = {
        childs = {
          flush = {
            args = "())",
            description = "Sends the contents of the frame buffer to the display immediately. Useful if you have called playdate.stop() to disable update callbacks in, say, the case where your app updates the display only in reaction to button presses.",
            returns = "(fun())",
            type = "function"
          },
          getHeight = {
            args = "()",
            description = "Returns the height the Playdate display, taking the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)\nEquivalent to playdate->display->getHeight() in the C API.",
            returns = "(number)",
            type = "function"
          },
          getInverted = {
            args = "()",
            description = "Returns the current value of the display invert flag.",
            returns = "(boolean)",
            type = "function"
          },
          getMosaic = {
            args = "()",
            description = "Returns the current mosaic effect settings as multiple values (`x`, `y`).",
            returns = "((number, number))",
            type = "function"
          },
          getOffset = {
            args = "()",
            description = "getOffset() returns the current display offset as multiple values (`x`, `y`).",
            returns = "((number, number))",
            type = "function"
          },
          getRect = {
            args = "()",
            description = "Returns the values `(x, y, width, height)` describing the Playdate display size. Takes the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)",
            returns = "(pd_rect)",
            type = "function"
          },
          getRefreshRate = {
            args = "()",
            description = "Returns the specified refresh rate in frames per second. See also playdate.getFPS() for `measured, actual` frame rate.",
            returns = "(number)",
            type = "function"
          },
          getScale = {
            args = "()",
            description = "Gets the display scale factor. Valid values for `scale` are 1, 2, 4, and 8.",
            returns = "(number)",
            type = "function"
          },
          getSize = {
            args = "()",
            description = "Returns the values `(width, height)` describing the Playdate display size. Takes the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)",
            returns = "((number, number))",
            type = "function"
          },
          getWidth = {
            args = "()",
            description = "Returns the width the Playdate display, taking the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)\nEquivalent to playdate->display->getWidth() in the C API.",
            returns = "(number)",
            type = "function"
          },
          loadImage = {
            args = "(path: string))",
            description = "The simplest method for putting an image on the display. Copies the contents of the image at `path` directly to the frame buffer. The image must be 400x240 pixels with no transparency.\nLoading an image via playdate.graphics.image.new() and drawing it at a desired coordinate with playdate.graphics.image:draw() offers more flexibility.",
            returns = "(fun(path: string))",
            type = "function"
          },
          setFlipped = {
            args = "(x: number, y: number))",
            description = "Flips the display on the x or y axis, or both.\nFunction arguments are booleans, and in Lua 0 evaluates to true.\nEquivalent to playdate->display->setFlipped() in the C API.",
            returns = "(fun(x: number, y: number))",
            type = "function"
          },
          setInverted = {
            args = "(flag: boolean))",
            description = "If the argument passed to setInverted() is true, the frame buffer will be drawn inverted (everything onscreen that was black will now be white, etc.)\nEquivalent to playdate->display->setInverted() in the C API.",
            returns = "(fun(flag: boolean))",
            type = "function"
          },
          setMosaic = {
            args = "(x: number, y: number))",
            description = "Adds a mosaic effect to the display. Valid `x` and `y` values are between 0 and 3, inclusive.\nEquivalent to playdate->display->setMosaic() in the C API.",
            returns = "(fun(x: number, y: number))",
            type = "function"
          },
          setOffset = {
            args = "(x: number, y: number))",
            description = "Offsets the entire display by `x`, `y`. Offset values can be negative. The \"exposed\" part of the display is black or white, according to the value set in playdate.graphics.setBackgroundColor(). This is an efficient way to make a \"shake\" effect without redrawing anything.\nThis function is different from playdate.graphics.setDrawOffset().\nEquivalent to playdate->display->setOffset() in the C API.\nExample: A screen shake effect using setOffset\n-- You can copy and paste this example directly as your main.lua file to see it in action\nimport \"CoreLibs/graphics\"\nimport \"CoreLibs/timer\"\n-- This function relies on the use of timers, so the timer core library\n-- must be imported, and updateTimers() must be called in the update loop\nlocal function screenShake(shakeTime, shakeMagnitude)\n    -- Creating a value timer that goes from shakeMagnitude to 0, over\n    -- the course of 'shakeTime' milliseconds\n    local shakeTimer = playdate.timer.new(shakeTime, shakeMagnitude, 0)\n    -- Every frame when the timer is active, we shake the screen\n    shakeTimer.updateCallback = function(timer)\n        -- Using the timer value, so the shaking magnitude\n        -- gradually decreases over time\n        local magnitude = math.floor(timer.value)\n        local shakeX = math.random(-magnitude, magnitude)\n        local shakeY = math.random(-magnitude, magnitude)\n        playdate.display.setOffset(shakeX, shakeY)\n    end\n    -- Resetting the display offset at the end of the screen shake\n    shakeTimer.timerEndedCallback = function()\n        playdate.display.setOffset(0, 0)\n    end\nend\nfunction playdate.update()\n    playdate.timer.updateTimers()\n    if playdate.buttonJustPressed(playdate.kButtonA) then\n        -- Shake the screen for 500ms, with the screen\n        -- shaking around by about 5 pixels on each side\n        screenShake(500, 5)\n    end\n    -- A circle to be able to view what the shaking looks like\n    playdate.graphics.fillCircleAtPoint(200, 120, 10)\nend",
            returns = "(fun(x: number, y: number))",
            type = "function"
          },
          setRefreshRate = {
            args = "(rate: number))",
            description = "Sets the desired refresh rate in frames per second. The default is 30 fps, which is a recommended figure that balances animation smoothness with performance and power considerations. Maximum is 50 fps.\nIf `rate` is 0, playdate.update() is called as soon as possible. Since the display refreshes line-by-line, and unchanged lines aren’t sent to the display, the update cycle will be faster than 30 times a second but at an indeterminate rate. playdate.getCurrentTimeMilliseconds() should then be used as a steady time base.\nEquivalent to playdate->display->setRefreshRate() in the C API.",
            returns = "(fun(rate: number))",
            type = "function"
          },
          setScale = {
            args = "(scale: number))",
            description = "Sets the display scale factor. Valid values for `scale` are 1, 2, 4, and 8.\nThe top-left corner of the frame buffer is scaled up to fill the display; e.g., if the scale is set to 4, the pixels in rectangle [0,100] x [0,60] are drawn on the screen as 4 x 4 squares.\nEquivalent to playdate->display->setScale() in the C API.",
            returns = "(fun(scale: number))",
            type = "function"
          }
        },
        type = "class"
      },
      downButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the down direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      downButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the down direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      drawFPS = {
        args = "(x: number, y: number))",
        description = "Calculates the current frames per second and draws that value at `x, y`.",
        returns = "(fun(x: number, y: number))",
        type = "function"
      },
      easingFunctions = {
        childs = {
          inBack = {
            args = "(t: number, b: number, c: number, d: number, s?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inBounce = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inCirc = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inCubic = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inElastic = {
            args = "(t: number, b: number, c: number, d: number, a?: number, p?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inExpo = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutBack = {
            args = "(t: number, b: number, c: number, d: number, s?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutBounce = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutCirc = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutCubic = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutElastic = {
            args = "(t: number, b: number, c: number, d: number, a?: number, p?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutExpo = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutQuad = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutQuart = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutQuint = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inOutSine = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inQuad = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inQuart = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inQuint = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          inSine = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          linear = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outBack = {
            args = "(t: number, b: number, c: number, d: number, s?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outBounce = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outCirc = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outCubic = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outElastic = {
            args = "(t: number, b: number, c: number, d: number, a?: number, p?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outExpo = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInBack = {
            args = "(t: number, b: number, c: number, d: number, s?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInBounce = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInCirc = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInCubic = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInElastic = {
            args = "(t: number, b: number, c: number, d: number, a?: number, p?: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInExpo = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInQuad = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInQuart = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInQuint = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outInSine = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outQuad = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outQuart = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outQuint = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          },
          outSine = {
            args = "(t: number, b: number, c: number, d: number)",
            description = '`t` is elapsed time\n`b` is the beginning value\n`c` is the change (or end value - start value)\n`d` is the duration\n`a` - amplitude\n`p` - period parameter\n`s` - amount of "overshoot"',
            returns = "(number)",
            type = "function"
          }
        },
        type = "class"
      },
      epochFromGMTTime = {
        args = "(time: pd_time_table)",
        description = "Returns the number of seconds and milliseconds between midnight (hour 0), January 1 2000 UTC and `time`, specified in GMT time, as a list: `(seconds, milliseconds)`.\n`time` should be a table of the same format as the one returned by playdate.getTime().",
        returns = "((number, number))",
        type = "function"
      },
      epochFromTime = {
        args = "(time: pd_time_table)",
        description = "Returns the number of seconds and milliseconds between midnight (hour 0), January 1 2000 UTC and `time`, specified in local time, as a list: `(seconds, milliseconds)`.\n`time` should be a table of the same format as the one returned by playdate.getTime().",
        returns = "((number, number))",
        type = "function"
      },
      file = {
        childs = {
          delete = {
            args = "(path: string, recursive?: boolean)",
            description = "Deletes the file at the given path. Returns true if successful, else false.\nIf `recursive` is true, this function will delete the directory at `path` and its contents, otherwise the directory must be empty to be deleted.",
            returns = "(boolean)",
            type = "function"
          },
          exists = {
            args = "(path: string)",
            description = "Returns true if a file exists at the given path. Unlike the image or sound loading functions, this function requires `path` to include the file extension since it cannot be inferred from context. Additionally, note that asset files are compiled into a format easier for Playdate to use and will have a different extension: .wav and .aiff audio files are compiled to .pda format, and .gif and .png files become `.pdi`s.",
            returns = "(boolean)",
            type = "function"
          },
          file = {
            childs = {
              kFileAppend = {
                returns = "(pd_filemode)",
                type = "value"
              },
              kFileRead = {
                returns = "(pd_filemode)",
                type = "value"
              },
              kFileWrite = {
                returns = "(pd_filemode)",
                type = "value"
              },
              kSeekFromCurrent = {
                returns = "(pd_seek_mode)",
                type = "value"
              },
              kSeekFromEnd = {
                returns = "(pd_seek_mode)",
                type = "value"
              },
              kSeekSet = {
                returns = "(pd_seek_mode)",
                type = "value"
              }
            },
            type = "class"
          },
          getSize = {
            args = "(path: string)",
            description = "Returns the size of the file at the given path.",
            returns = "(number)",
            type = "function"
          },
          getType = {
            args = "(path: string)",
            description = "Returns the type of the file at the given path.",
            returns = "(pd_UNDOCUMENTED)",
            type = "function"
          },
          isdir = {
            args = "(path: string)",
            description = "Returns true if a directory exists at the given path.",
            returns = "(boolean)",
            type = "function"
          },
          kFileAppend = {
            returns = "(pd_filemode)",
            type = "value"
          },
          kFileRead = {
            returns = "(pd_filemode)",
            type = "value"
          },
          kFileWrite = {
            returns = "(pd_filemode)",
            type = "value"
          },
          kSeekFromCurrent = {
            returns = "(pd_seek_mode)",
            type = "value"
          },
          kSeekFromEnd = {
            returns = "(pd_seek_mode)",
            type = "value"
          },
          kSeekSet = {
            returns = "(pd_seek_mode)",
            type = "value"
          },
          listFiles = {
            args = "(path: string, showhidden?: boolean)",
            description = 'Returns an array containing the file names in the given directory path as strings. Folders are indicated by a slash / at the end of the filename. If `showhidden` is set, files beginning with a period will be included; otherwise, they are skipped.\nCall with no argument to get a list of all files and folders your game has access to. (For a game with default access permissions, listFiles(), listFiles("/"), and listFiles(".") should all return the same result.)\nEquivalent to playdate->file->listfiles() in the C API.\nLearn more about the Playdate filesystem.',
            returns = "(string[])",
            type = "function"
          },
          load = {
            args = "(path: string, env?: table)",
            description = "Loads the compiled `.pdz` file at the given location and returns the contents as a function. The .pdz extension on `path` is optional.\n`env`, if specified, is a table to use as the function’s global namespace instead of `_G`.",
            returns = "(fun())",
            type = "function"
          },
          mkdir = {
            args = "(path: string))",
            description = 'Creates a directory at the given path, under the /Data/<bundleid> folder. See About the Playdate Filesystem for details.\nplaydate.file.mkdir() will create all intermediate directories, if a succession of directories ("testdir/testdir/testdir/") is specified in `path`.\nEquivalent to playdate->file->mkdir() in the C API.',
            returns = "(fun(path: string))",
            type = "function"
          },
          modtime = {
            args = "(path: string)",
            description = "Returns the modification date/time of the file at the given path, as a table with keys:\n`year`: 4-digit year (until 10,000 AD)\n`month`: month of the year, where 1 is January and 12 is December\n`day`: day of the month, 1 - 31\n`hour`: 0 - 23\n`minute`: 0 - 59\n`second`: 0 - 59 (or 60 on a leap second)",
            returns = "(pd_file_time_table)",
            type = "function"
          },
          open = {
            args = "(path: string, mode?: pd_filemode)",
            description = "Returns a playdate.file.file corresponding to the opened file. `mode` should be one of the following:\nplaydate.file.kFileRead: the file is opened for reading; the system first looks in the /Data/<bundleid> folder for the given file, then in the game’s pdx folder if it isn’t found\nplaydate.file.kFileWrite: the file is created if it doesn’t exist, truncated to zero length if it does, then opened for writing\nplaydate.file.kFileAppend: the file is created if it doesn’t exist, opened for writing, with new data written to the end of the file\nIf `mode` is not specified, the default is `playdate.file.kFileRead`.\nIf the file couldn’t be opened, a second return value indicates the error. The filesystem has a limit of 64 simultaneous open files.\nEquivalent to playdate->file->open() in the C API.",
            returns = "(pd_file_file)",
            type = "function"
          },
          rename = {
            args = "(path: string, newPath: string)",
            description = "Renames the file at `path`, if it exists, to the value of newPath. This can result in the file being moved to a new directory, but directories will not be created. Returns true if the operation was successful.\nEquivalent to playdate->file->rename() in the C API.",
            returns = "(boolean)",
            type = "function"
          },
          run = {
            args = "(path: string, env?: table))",
            description = "Runs the pdz file at the given location. Equivalent to playdate.file.load(path, env)().\nThe `.pdz` extension on `path` is optional. Values returned from the pdz file are left on the stack.\n`env`, if specified, is a table to use as the function’s global namespace instead of `_G`.",
            returns = "(fun(path: string, env?: table | nil)",
            type = "function"
          }
        },
        type = "class"
      },
      frameTimer = {
        childs = {
          allTimers = {
            args = "()",
            description = 'Returns an array listing all running frameTimers.\nNote the "." syntax rather than ":". This is a class method, not an instance method.',
            returns = "(pd_frameTimer[])",
            type = "function"
          },
          new = {
            args = "(fun(duration: number, callback: fun(...), ...: any): pd_frameTimer) | (fun(duration: number, startValue?: number, endValue?: number, easingFunction?: (fun(number, number, number, number): number)",
            description = "### Overload 1 ###\nReturns a new playdate.frameTimer that will run for `duration` frames. `callback` is a function closure that will be called when the timer is complete.\nAccepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.\nBy default, frame timers start upon instantiation. To modify the behavior of a frame timer, see common frame timer methods and properties.\n### Overload 2 ###\nReturns a new playdate.frameTimer that will run for `duration` number of frames. If not specified, `startValue` and `endValue` will be 0, and a linear easing function will be used.\nBy default, frame timers start upon instantiation. To modify the behavior of a frame timer, see common frame timer methods and properties.",
            returns = "(pd_frameTimer))",
            type = "function"
          },
          performAfterDelay = {
            args = "(delay: number, callback: fun(...), ...: any))",
            description = "Performs the function `callback` after the `delay` number of frames. Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.",
            returns = "(fun(delay: number, callback: fun(...), ...: any))",
            type = "function"
          },
          updateTimers = {
            args = "())",
            description = "This should be called from the main playdate.update() loop to drive the frame timers.",
            returns = "(fun())",
            type = "function"
          }
        },
        type = "class"
      },
      gameWillPause = {
        args = "nil | (fun())",
        description = "Called before the system pauses the game. (In the current version of Playdate OS, this only happens when the device’s Menu button is pushed.) Implementing these functions allows your game to take special action when it is paused, e.g., updating the menu image.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      gameWillResume = {
        args = "nil | (fun())",
        description = "Called before the system resumes the game.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      gameWillTerminate = {
        args = "nil | (fun())",
        description = "Called when the player chooses to exit the game via the System Menu or Menu button.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      geometry = {
        childs = {
          affineTransform = {
            childs = {
              new = {
                args = "(fun(m11: number, m12: number, m21: number, m22: number, tx: number, ty: number): pd_affineTransform) | (fun(",
                description = "### Overload 1 ###\nReturns a new playdate.geometry.affineTransform. Use new() instead to get a new copy of the identity transform.\n### Overload 2 ###\nReturns a new playdate.geometry.affineTransform that is the identity transform.",
                returns = "(pd_affineTransform))",
                type = "function"
              }
            },
            type = "class"
          },
          arc = {
            type = "class"
          },
          distanceToPoint = {
            args = "(x1: number, y1: number, x2: number, y2: number)",
            description = "Returns the the distance from point `(x1, y1)` to point `(x2, y2)`.\nCompared to geometry.point:distanceToPoint(), this version will be slightly faster.",
            returns = "(number)",
            type = "function"
          },
          kFlippedX = {
            returns = "(pd_flip)",
            type = "value"
          },
          kFlippedXY = {
            returns = "(pd_flip)",
            type = "value"
          },
          kFlippedY = {
            returns = "(pd_flip)",
            type = "value"
          },
          kUnflipped = {
            returns = "(pd_flip)",
            type = "value"
          },
          lineSegment = {
            childs = {
              fast_intersection = {
                args = "(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number, x4: number, y4: number)",
                description = "For use in inner loops where speed is the priority.\nReturns true if there is an intersection between the line segments defined by `(x1, y1)`, `(x2, y2)` and `(x3, y3)`, `(x4, y4)`. If there is an intersection, `x, y` values representing the intersection point are also returned.",
                returns = "(boolean)",
                type = "function"
              },
              new = {
                args = "(x1: number, y1: number, x2: number, y2: number)",
                description = "Returns a new playdate.geometry.lineSegment.",
                returns = "(pd_lineSegment)",
                type = "function"
              }
            },
            type = "class"
          },
          point = {
            childs = {
              new = {
                args = "(x: number, y: number)",
                description = "Returns a new playdate.geometry.point.",
                returns = "(pd_point)",
                type = "function"
              }
            },
            type = "class"
          },
          polygon = {
            childs = {
              new = {
                args = "(fun(x1: number, y1: number, x2: number, y2: number, x3?: number, y3?: number, ...: number): pd_polygon) | (fun(p1: pd_point, p2: pd_point, p3?: pd_point, p4?: pd_point, p5?: pd_point, p6?: pd_point, ...: pd_point): pd_polygon) | (fun(numberOfVertices: number",
                description = "new(x1, y1, x2, y2, ..., xn, yn) returns a new playdate.geometry.polygon with vertices `(x1, y1)` through `(xn, yn)`. The Lua function table.unpack() can be used to turn an array into function arguments.\nnew(p1, p2, ..., pn) does the same, except the points are expressed via point objects.\nnew(numberOfVertices) returns a new playdate.geometry.polygon with space allocated for `numberOfVertices` vertices. All vertices are initially (0, 0). Vertex coordinates can be set with playdate.geometry.polygon:setPointAt().\nIf the polygon’s first and last points are coincident, the polygon will be considered closed. Alternatively, you may call :close() to automatically close the polygon.\nTo draw a polygon, use playdate.graphics.drawPolygon().",
                returns = "(pd_polygon))",
                type = "function"
              }
            },
            type = "class"
          },
          rect = {
            childs = {
              fast_intersection = {
                args = "(x1: number, y1: number, w1: number, h1: number, x2: number, y2: number, w2: number, h2: number)",
                description = "For use in inner loops where speed is the priority. About 3x faster than intersection.\nReturns multiple values (`x, y, width, height`) representing the overlapping portion of the two rects defined by `x1, y1, w1, h1` and `x2, y2, w2, h2`. If there is no intersection, (0, 0, 0, 0) is returned.",
                returns = "((number, number, number, number))",
                type = "function"
              },
              fast_union = {
                args = "(x1: number, y1: number, w1: number, h1: number, x2: number, y2: number, w2: number, h2: number)",
                description = "For use in inner loops where speed is the priority. About 3x faster than union.\nReturns multiple values (`x, y, width, height`) representing the smallest possible rect that contains the two rects defined by `x1, y1, w1, h1` and `x2, y2, w2, h2`.",
                returns = "((number, number, number, number))",
                type = "function"
              },
              new = {
                args = "(x: number, y: number, width: number, height: number)",
                description = "Returns a new playdate.geometry.rect.",
                returns = "(pd_rect)",
                type = "function"
              }
            },
            type = "class"
          },
          size = {
            childs = {
              new = {
                args = "(width: number, height: number)",
                description = "Returns a new playdate.geometry.size.",
                returns = "(pd_size)",
                type = "function"
              }
            },
            type = "class"
          },
          squaredDistanceToPoint = {
            args = "(x1: number, y1: number, x2: number, y2: number)",
            description = "Returns the square of the distance from point `(x1, y1)` to point `(x2, y2)`.\nCompared to geometry.point:squaredDistanceToPoint(), this version will be slightly faster.",
            returns = "(number)",
            type = "function"
          },
          vector2D = {
            childs = {
              new = {
                args = "(x: number, y: number)",
                description = "Returns a new playdate.geometry.vector2D.",
                returns = "(pd_vector2D)",
                type = "function"
              },
              newPolar = {
                args = "(length: number, angle: number)",
                description = "Returns a new playdate.geometry.vector2D. Angles should be specified in degrees. Zero degrees represents the top of the circle.",
                returns = "(pd_vector2D)",
                type = "function"
              }
            },
            type = "class"
          }
        },
        type = "class"
      },
      getBatteryPercentage = {
        args = "()",
        description = "Returns a value from 0-100 denoting the current level of battery charge. 0 = empty; 100 = full.",
        returns = "(number)",
        type = "function"
      },
      getBatteryVoltage = {
        args = "()",
        description = "Returns the battery’s current voltage level.",
        returns = "(number)",
        type = "function"
      },
      getButtonState = {
        args = "()",
        description = "Returns the above data in one call, with multiple return values (`current`, `pressed`, `released`) containing bitmasks indicating which buttons are currently down, and which were pressed and released since the last update. For example, if the d-pad left button and the A button are both down, the `current` value will be (`playdate.kButtonA`|`playdate.kButtonLeft`).",
        returns = "((integer, integer, integer))",
        type = "function"
      },
      getCrankChange = {
        args = "()",
        description = "Returns two values, `change` and `acceleratedChange`. `change` represents the angle change (in degrees) of the crank since the last time this function (or the playdate.cranked() callback) was called. Negative values are anti-clockwise. `acceleratedChange` is change multiplied by a value that increases as the crank moves faster, similar to the way mouse acceleration works.\nlocal change, acceleratedChange = playdate.getCrankChange()",
        returns = "((number, number))",
        type = "function"
      },
      getCrankPosition = {
        args = "()",
        description = "Returns the absolute position of the crank (in degrees). Zero is pointing straight up parallel to the device. Turning the crank clockwise (when looking at the right edge of an upright device) increases the angle, up to a maximum value 359.9999. The value then resets back to zero as the crank continues its rotation.\nlocal crankPosition = playdate.getCrankPosition()",
        returns = "(number)",
        type = "function"
      },
      getCrankTicks = {
        args = "(ticksPerRevolution: number)",
        description = 'Returns the number of "ticks" — whose frequency is defined by the value of `ticksPerRevolution` — the crank has turned through since the last time this function was called. Tick boundaries are set at absolute positions along the crank’s rotation. Ticks can be positive or negative, depending upon the direction of rotation.\nFor example, say you have a movie player and you want your movie to advance 6 frames for every one revolution of the crank. Calling playdate.getCrankTicks(6) during each update will give you a return value of 1 as the crank turns past each 60 degree increment. (Since we passed in a 6, each tick represents 360 ÷ 6 = 60 degrees.) So getCrankTicks(6) will return a 1 as the crank turns past the 0 degree absolute position, the 60 degree absolute position, and so on for the 120, 180, 240, and 300 degree positions. Otherwise, 0 will be returned. (-1 will be returned if the crank moves past one of these mentioned positions while going in a backward direction.)\nYou must import `CoreLibs/crank` to use getCrankTicks().\nExample: Reading crank input using getCrankTicks\nimport "CoreLibs/crank"\nlocal ticksPerRevolution = 6\nfunction playdate.update()\n    local crankTicks = playdate.getCrankTicks(ticksPerRevolution)\n    if crankTicks == 1 then\n        print("Forward tick")\n    elseif crankTicks == -1 then\n        print("Backward tick")\n    end\nend',
        returns = "(number)",
        type = "function"
      },
      getCurrentTimeMilliseconds = {
        args = "()",
        description = "Returns the number of milliseconds the game has been `active` since launched.",
        returns = "(number)",
        type = "function"
      },
      getElapsedTime = {
        args = "()",
        description = "Returns the number of seconds since playdate.resetElapsedTime() was called. The value is a floating-point number with microsecond accuracy.",
        returns = "(number)",
        type = "function"
      },
      getFPS = {
        args = "()",
        description = "Returns the `measured, actual` refresh rate in frames per second. This value may be different from the `specified` refresh rate (see playdate.display.getRefreshRate()) by a little or a lot depending upon how much calculation is being done per frame.",
        returns = "(number)",
        type = "function"
      },
      getFlipped = {
        args = "()",
        description = 'Returns `true` if the user has checked the "Upside Down" option in Playdate Settings; `false` otherwise. (Upside Down mode can be convenient for players wanting to hold Playdate upside-down so they can use their left hand to operate the crank.)\nTypically your game doesn’t need to anything in regards to this setting. But it is available in case your game wants to take some special actions, display special instructions, etc.\nReported d-pad directions are flipped when in Upside Down mode — RIGHT will be reported as LEFT, UP as DOWN, etc. — so that the d-pad will make sense to a user holding Playdate upside-down. However, the A and B buttons — since they are still labeled as "A" and "B" — retain their normal meanings and will be reported as usual.',
        returns = "(boolean)",
        type = "function"
      },
      getGMTTime = {
        args = "()",
        description = "Returns a table in the same format as playdate.getTime(), but in GMT rather than local time.",
        returns = "(pd_time_table)",
        type = "function"
      },
      getPowerStatus = {
        args = "()",
        description = "Returns a table holding booleans with the following keys:\n`charging`: The battery is actively being charged\n`USB`: There is a powered USB cable connected\n`screws`: There is 5V being applied to the corner screws (via the dock, for example)",
        returns = "(table)",
        type = "function"
      },
      getReduceFlashing = {
        args = "()",
        description = 'Returns `true` if the user has checked the "Reduce Flashing" option in Playdate Settings; `false` otherwise. Games should read this value and, if `true`, avoid visuals that could be problematic for people with sensitivities to flashing lights or patterns.',
        returns = "(boolean)",
        type = "function"
      },
      getSecondsSinceEpoch = {
        args = "()",
        description = "Returns the number of seconds and milliseconds elapsed since midnight (hour 0), January 1 2000 UTC, as a list: `(seconds, milliseconds)`. This function is suitable for seeding the random number generator:\nSample code for seeding the random number generator\nmath.randomseed(playdate.getSecondsSinceEpoch())",
        returns = "((number, number))",
        type = "function"
      },
      getStats = {
        args = "()",
        description = "Returns a table containing percentages of time spent in each system task over the last interval, if more than zero. Possible keys are\nkernel\nserial\ngame\nGC\nwifi\naudio\ntrace\nidle\nplaydate.getStats() only functions on a Playdate device. In the Simulator, this function returns nil.",
        returns = "(pd_stats_table)",
        type = "function"
      },
      getSystemLanguage = {
        args = "()",
        description = "Returns the current language of the system, which will be one of the constants `playdate.graphics.font.kLanguageEnglish` or `playdate.graphics.font.kLanguageJapanese`.",
        returns = "(pd_language)",
        type = "function"
      },
      getSystemMenu = {
        args = "()",
        description = "Returns a playdate.menu object. Use this to add your custom menu items.",
        returns = "(pd_menu)",
        type = "function"
      },
      getTime = {
        args = "()",
        description = "Returns a table with values for the local time, accessible via the following keys:\n`year`: 4-digit year (until 10,000 AD)\n`month`: month of the year, where 1 is January and 12 is December\n`day`: day of the month, 1 - 31\n`weekday`: day of the week, where 1 is Monday and 7 is Sunday\n`hour`: 0 - 23\n`minute`: 0 - 59\n`second`: 0 - 59 (or 60 on a leap second)\n`millisecond`: 0 - 999",
        returns = "(pd_time_table)",
        type = "function"
      },
      graphics = {
        childs = {
          animation = {
            childs = {
              blinker = {
                childs = {
                  new = {
                    args = "(onDuration?: number, offDuration?: number, loop?: boolean, cycles?: integer, default?: boolean)",
                    description = 'Creates a new blinker object. Check the object’s on property to determine whether the blinker is on (true) or off (false). The default properties are:\n`onDuration`: 200 (the number of milliseconds the blinker is "on")\n`offDuration`: 200 (the number of milliseconds the blinker is "off")\n`loop`: false (should the blinker restart after completing)\n`cycles`: 6 (the number of changes the blinker goes through before it’s complete)\n`default`: true (the state the blinker will start in. Note: if default is true, blinker.on will return true when the blinker is in its `onDuration` phase. If default is false, blinker.on will return false when the blinker is in its `onDuration` phase.)\nOther informative properties:\n`counter`: Read this property to see which cycle the blinker is on (counts from `n` down to zero)\n`on`: Read this property to determine the current state of the blinker. The blinker always starts in the state specified by the default property.\n`running`: Read this property to see if the blinker is actively running',
                    returns = "(pd_blinker)",
                    type = "function"
                  },
                  stopAll = {
                    args = "())",
                    description = "Stops all blinkers.",
                    returns = "(fun())",
                    type = "function"
                  },
                  updateAll = {
                    args = "())",
                    description = "Updates the state of all valid blinkers by calling :update() on each.\nIf you intend to use blinkers, be sure to call :updateAll() once a cycle, ideally in your game’s playdate.update() function.",
                    returns = "(fun())",
                    type = "function"
                  }
                },
                type = "class"
              },
              loop = {
                childs = {
                  new = {
                    args = "(delay?: number, imageTable?: pd_imagetable, shouldLoop?: boolean)",
                    description = "Creates a new animation object.\n`imageTable` should be a playdate.graphics.imagetable, or nil.\nThe following properties can be read or set directly, and have these defaults:\n`delay` : the value of `delay`, if passed, or 100ms (the delay before moving to the next frame)\n`startFrame` : 1 (the value the object resets to when the loop completes)\n`endFrame` : the number of images in `imageTable` if passed, or 1 (the last frame value in the loop)\n`frame` : 1 (the current frame counter)\n`step` : 1 (the value by which frame increments)\n`shouldLoop` : the value of `shouldLoop`, if passed, or true. (whether the object loops when it completes)\n`paused` : false (paused loops don’t change their frame value)",
                    returns = "(pd_loop)",
                    type = "function"
                  }
                },
                type = "class"
              }
            },
            type = "class"
          },
          animator = {
            childs = {
              new = {
                args = "(fun(duration: number, startValue: number, endValue: number, easingFunction?: (fun(number, number, number, number): number), startTimeOffset?: number): pd_animator) | (fun(duration: number, lineSegment: pd_lineSegment, easingFunction?: (fun(number, number, number, number): number), startTimeOffset?: number): pd_animator) | (fun(duration: number, arc: pd_arc, easingFunction?: (fun(number, number, number, number): number), startTimeOffset?: number): pd_animator) | (fun(duration: number, polygon: pd_polygon, easingFunction?: (fun(number, number, number, number): number), startTimeOffset?: number): pd_animator) | (fun(durations: number[], parts: (pd_lineSegment|pd_arc|pd_polygon)[], easingFunctions: (fun(number, number, number, number): number), startTimeOffset?: number",
                description = "### Overload 1 ###\nAnimates between two number or playdate.geometry.point values.\n`duration` is the total time of the animation in milliseconds.\n`startValue` and `endValue` should be either numbers or playdate.geometry.point\n`easingFunction`, if supplied, should be a value from playdate.easingFunctions. If your easing function requires additional variables `s`, `a`, or `p`, set them on the animator directly after creation. For example:\nlocal a = playdate.graphics.animator.new(1000, 0, 100, playdate.easingFunctions.inBack)\na.s = 1.9\n`startTimeOffset`, if supplied, will shift the start time of the animation by the specified number of milliseconds. (If positive, the animation will be delayed. If negative, the animation will effectively have started before the moment the animator is instantiated.)\nExample: Using an animator to animate movement\n-- You can copy and paste this example directly as your main.lua file to see it in action\nimport \"CoreLibs/graphics\"\nimport \"CoreLibs/animator\"\n-- We'll be demonstrating how to use an animator to animate a square moving across the screen\nlocal square = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)\n-- 1000ms, or 1 second\nlocal animationDuration = 1000\n-- We're animating from the left to the right of the screen\nlocal startX, endX = -20, 400\n-- Setting an easing function to get a nice, smooth movement\nlocal easingFunction = playdate.easingFunctions.inOutCubic\nlocal animator = playdate.graphics.animator.new(animationDuration, startX, endX, easingFunction)\nanimator.repeatCount = -1 -- Make animator repeat forever\nfunction playdate.update()\n    -- Clear the screen\n    playdate.graphics.clear()\n    -- By using :currentValue() as the x value, the square follows along with the animation\n    square:draw(animator:currentValue(), 120)\nend\n### Overload 2 ###\nCreates a new Animator that will animate along the provided playdate.geometry.lineSegment\nExample: Using an animator to animate along a line\n-- You can copy and paste this example directly as your main.lua file to see it in action\nimport \"CoreLibs/graphics\"\nimport \"CoreLibs/animator\"\n-- We'll be demonstrating how to use an animator to animate a square moving across the screen\nlocal square = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)\n-- 1000ms, or 1 second\nlocal animationDuration = 1000\n-- We're animating from the top left to the bottom right of the screen\nlocal line = playdate.geometry.lineSegment.new(0, 0, 400, 240)\nlocal animator = playdate.graphics.animator.new(animationDuration, line)\nfunction playdate.update()\n    -- Clear the screen\n    playdate.graphics.clear()\n    -- We can use :currentValue() directly, as it returns a point\n    square:draw(animator:currentValue())\nend\n### Overload 3 ###\nCreates a new Animator that will animate along the provided playdate.geometry.arc\n### Overload 4 ###\nCreates a new Animator that will animate along the provided playdate.geometry.polygon\n### Overload 5 ###\nCreates a new Animator that will animate along each of the items in the `parts` array in order, which should be comprised of playdate.geometry.lineSegment, playdate.geometry.arc, or playdate.geometry.polygon objects.\n`durations` should be an array of durations, one for each item in `parts`.\n`easingFunctions` should be an array of playdate.easingFunctions, one for each item in `parts`.\nBy default, animators do not repeat. If you would like them to, set the animator’s `repeatCount` property to the number of times the animation should repeat. It can be set to any positive number or -1 to indicate the animation should repeat forever. Note that a repeat count of 1 means the animation will play twice - once for the initial animation plus one repeat.\nExample: Using an animator with parts\n-- You can copy and paste this example directly as your main.lua file to see it in action\nimport \"CoreLibs/graphics\"\nimport \"CoreLibs/animator\"\n-- We'll be demonstrating how to animate something with parts\nlocal square = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)\n-- First part will take 3 seconds, second part will take 1, and third part will take 2\nlocal animationDurations = {3000, 1000, 2000}\n-- We'll first animate along a line, then an arc, and then a polygon\nlocal animationParts = {\n    playdate.geometry.lineSegment.new(0, 0, 200, 80),\n    playdate.geometry.arc.new(200, 120, 40, 0, 180),\n    playdate.geometry.polygon.new(200, 160, 300, 90, 390, 230)\n}\n-- We must set the easing functions for each part, and they can all be different\nlocal animationEasingFunctions = {\n    playdate.easingFunctions.outQuart,\n    playdate.easingFunctions.inOutCubic,\n    playdate.easingFunctions.outBounce\n}\n-- To animate by parts, each argument must be arrays of equal length\nlocal animator = playdate.graphics.animator.new(animationDurations, animationParts, animationEasingFunctions)\nfunction playdate.update()\n    -- Clear the screen\n    playdate.graphics.clear()\n    -- We can use :currentValue() directly, as it returns a point\n    square:draw(animator:currentValue())\nend",
                returns = "(pd_animator))",
                type = "function"
              }
            },
            type = "class"
          },
          checkAlphaCollision = {
            args = "(image1: pd_image, x1: number, y1: number, flip1: pd_image_flip, image2: pd_image, x2: number, y2: number, flip2: pd_image_flip)",
            description = "Returns true if the non-alpha-masked portions of `image1` and `image2` overlap if they were drawn at positions (`x1`, `y1`) and (`x2`, `y2`) and flipped according to `flip1` and `flip2`, which should each be one of the values listed in playdate.graphics.image:draw().",
            returns = "(boolean)",
            type = "function"
          },
          clear = {
            args = "(color?: pd_color))",
            description = "Clears the entire display, setting the color to either the given `color` argument, or the current background color set in setBackgroundColor(color) if no argument is given.\nEquivalent to playdate->graphics->clear() in the C API.",
            returns = "(fun(color?: pd_color | nil)",
            type = "function"
          },
          clearClipRect = {
            args = "())",
            description = "Clears the current clipping rectangle, set with setClipRect().\nEquivalent to playdate->graphics->clearClipRect() in the C API.",
            returns = "(fun())",
            type = "function"
          },
          clearStencil = {
            args = "())",
            description = "Clears the stencil buffer.",
            returns = "(fun())",
            type = "function"
          },
          clearStencilImage = {
            args = "())",
            description = "`Deprecated.`\nClears the stencil buffer.",
            returns = "(fun())",
            type = "function"
          },
          drawArc = {
            args = "(fun(arc: pd_arc)) | (fun(x: number, y: number, radius: number, startAngle: number, endAngle: number))",
            description = "Draws an arc using the current color.\nAngles are specified in degrees, not radians.",
            returns = "((fun(arc: pd_arc)) | (fun(x: number, y: number, radius: number, startAngle: number, endAngle: number)))",
            type = "function"
          },
          drawCircleAtPoint = {
            args = "(fun(x: number, y: number, radius: number)) | (fun(p: pd_point, radius: number))",
            description = "Draws a circle at the point `(x, y)` (or `p`) with radius `radius`.",
            returns = "((fun(x: number, y: number, radius: number)) | (fun(p: pd_point, radius: number)))",
            type = "function"
          },
          drawCircleInRect = {
            args = "(fun(x: number, y: number, width: number, height: number)) | (fun(r: pd_rect))",
            description = "Draws a circle in the rect `r` or the rect with origin `(x, y)` and size `(width, height)`.\nIf the rect is not a square, the circle will be drawn centered in the rect.",
            returns = "((fun(x: number, y: number, width: number, height: number)) | (fun(r: pd_rect)))",
            type = "function"
          },
          drawEllipseInRect = {
            args = "(fun(x: number, y: number, width: number, height: number, startAngle?: number, endAngle?: number)) | (fun(rect: pd_rect, startAngle?: number, endAngle?: number))",
            description = "Draws an ellipse in the rect `r` or the rect with origin `(x, y)` and size `(width, height)`.\n`startAngle` and `endAngle`, if provided, should be in degrees (not radians), and will cause only the segment of the ellipse between `startAngle` and `endAngle` to be drawn.",
            returns = "((fun(x: number, y: number, width: number, height: number, startAngle?: number, endAngle?: number)) | (fun(rect: pd_rect, startAngle?: number, endAngle?: number) | nil)",
            type = "function"
          },
          drawLine = {
            args = "(fun(x1: number, y1: number, x2: number, y2: number)) | (fun(ls: pd_lineSegment))",
            description = "Draws a line from (`x1`, `y1`) to (`x2`, `y2`), or draws the playdate.geometry.lineSegment `ls`.\nLine width is specified by setLineWidth(). End cap style is specified by setLineCapStyle().\nEquivalent to playdate->graphics->drawLine() in the C API.",
            returns = "((fun(x1: number, y1: number, x2: number, y2: number)) | (fun(ls: pd_lineSegment)))",
            type = "function"
          },
          drawLocalizedText = {
            args = "(fun(key: string, x: number, y: number, width?: number, height?: number, language?: pd_language, leadingAdjustment?: number, wrapMode?: pd_wrap_mode, alignment?: pd_text_alignment)) | (fun(key: string, rect: pd_rect, language?: pd_language, leadingAdjustment?: number))",
            description = 'Draws the text found by doing a lookup of `key` in the .strings file corresponding to the current system language, or `language`, if specified.\nThe optional `language` argument can be one of the strings "en", "jp", or one of the constants:\n`playdate.graphics.font.kLanguageEnglish`\n`playdate.graphics.font.kLanguageJapanese`\nOther arguments work the same as in drawText().\nFor more information about localization and strings files, see the Localization section.',
            returns = "((fun(key: string, x: number, y: number, width?: number, height?: number, language?: pd_language, leadingAdjustment?: number, wrapMode?: pd_wrap_mode, alignment?: pd_text_alignment)) | (fun(key: string, rect: pd_rect, language?: pd_language, leadingAdjustment?: number) | nil)",
            type = "function"
          },
          drawLocalizedTextAligned = {
            args = "(text: string, x: number, y: number, alignment: pd_text_alignment, language?: pd_language, leadingAdjustment?: number))",
            description = "You must import `CoreLibs/graphics` to use this function.\nSame as drawTextAligned() except localized text is drawn.",
            returns = "(fun(text: string, x: number, y: number, alignment: pd_text_alignment, language?: pd_language, leadingAdjustment?: number | nil)",
            type = "function"
          },
          drawLocalizedTextInRect = {
            args = "(fun(text: string, x: number, y: number, width: number, height: number, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font, language?: pd_language)) | (fun(text: string, rect: pd_rect, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font, language?: pd_language))",
            description = "You must import `CoreLibs/graphics` to use these functions.\nSame as drawTextInRect() except localized text is drawn.",
            returns = "((fun(text: string, x: number, y: number, width: number, height: number, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font, language?: pd_language)) | (fun(text: string, rect: pd_rect, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font, language?: pd_language) | nil)",
            type = "function"
          },
          drawPixel = {
            args = "(x: number, y: number))",
            description = "Draw a single pixel in the current color at (`x`, `y`).\nplaydate.graphics.drawPixel(p)\nDraw a single pixel in the current color at playdate.geometry.point `p`.",
            returns = "(fun(x: number, y: number))",
            type = "function"
          },
          drawPolygon = {
            args = "(fun(p: pd_polygon)) | (fun(x1: number, y1: number, x2: number, y2: number, ...: number))",
            description = "### Overload 1 ###\nDraw the playdate.geometry.polygon `p`. Only draws a line between the first and last vertex if the polygon is closed.\nLine width is specified by setLineWidth().\n### Overload 2 ###\nDraw the polygon specified by the given sequence of x,y coordinates, including an edge between the last vertex and the first. The Lua function table.unpack() can be used to turn an array into function arguments.\nLine width is specified by setLineWidth().",
            returns = "((fun(p: pd_polygon)) | (fun(x1: number, y1: number, x2: number, y2: number, ...: number)))",
            type = "function"
          },
          drawRect = {
            args = "(fun(x: number, y: number, w: number, h: number)) | (fun(r: pd_rect))",
            description = "Draws the rect `r` or the rect with origin (`x`, `y`) with a size of (`w`, `h`).\nLine width is specified by setLineWidth(). Stroke location is specified by setStrokeLocation().\nEquivalent to playdate->graphics->drawRect() in the C API.",
            returns = "((fun(x: number, y: number, w: number, h: number)) | (fun(r: pd_rect)))",
            type = "function"
          },
          drawRoundRect = {
            args = "(fun(x: number, y: number, w: number, h: number, radius: number)) | (fun(r: pd_rect, radius: number))",
            description = "Draws a rectangle with rounded corners in the rect `r` or the rect with origin (`x`, `y`) and size (`w`, `h`).\n`radius` defines the radius of the corners.",
            returns = "((fun(x: number, y: number, w: number, h: number, radius: number)) | (fun(r: pd_rect, radius: number)))",
            type = "function"
          },
          drawSineWave = {
            args = "(startX: number, startY: number, endX: number, endY: number, startAmplitude: number, endAmplitude: number, period: number, phaseShift?: number))",
            description = "You must import `CoreLibs/graphics` to use this function.\nDraws an approximation of a sine wave between the points `startX, startY` and `endX, endY`.\n`startAmplitude`: The number of pixels above and below the line from `startX, startY` and `endX, endY` the peaks and valleys of the wave will be drawn at the start of the wave.\n`endAmplitude`: The number of pixels above and below the line from `startX, startY` and `endX, endY` the peaks and valleys of the wave will be drawn at the end of the wave.\n`period`: The distance between peaks, in pixels.\n`phaseShift`: If provided, specifies the wave’s offset, in pixels.",
            returns = "(fun(startX: number, startY: number, endX: number, endY: number, startAmplitude: number, endAmplitude: number, period: number, phaseShift?: number | nil)",
            type = "function"
          },
          drawText = {
            args = "(fun(text: string, x: number, y: number, width?: number, height?: number, fontFamily?: pd_font_family, leadingAdjustment?: number, wrapMode?: pd_wrap_mode, alignment?: pd_text_alignment): (number, number)) | (fun(text: string, rect: pd_rect, fontFamily?: pd_font_family, leadingAdjustment?: number, wrapMode?: pd_wrap_mode, alignment?: pd_text_alignment",
            description = 'Draws the text using the current font and font advance at location (`x`, `y`). If `width` and `height` are specified, drawing is constrained to the rectangle (x,y,width,height), using the given `wrapMode` and `alignment`, if provided. Alternatively, a playdate.geometry.rect object can be passed instead of x,y,width,height. Valid values for `wrapMode` are\n`playdate.graphics.kWrapClip`\n`playdate.graphics.kWrapCharacter`\n`playdate.graphics.kWrapWord`\nand values for `alignment` are\n`playdate.graphics.kAlignLeft`\n`playdate.graphics.kAlignCenter`\n`playdate.graphics.kAlignRight`\nThe default wrap mode is playdate.graphics.kWrapWord and the default alignment is playdate.graphics.kAlignLeft.\nIf `fontFamily` is provided, the text is draw using the given fonts instead of the currently set font. `fontFamily` should be a table of fonts using keys as specified in setFontFamily(fontFamily).\nThe optional `leadingAdjustment` may be used to modify the spacing between lines of text. Pass nil to use the default leading for the font.\nReturns two numbers indicating the width and height of the drawn text.\nStyling text\nTo draw bold text, surround the bold portion of text with asterisks. To draw italic text, surround the italic portion of text with underscores. For example:\nplaydate.graphics.drawText("normal *bold* _italic_", x, y)\nwhich will output: "normal bold `italic`". Bold and italic font variations must be set using setFont() with the appropriate variant argument, otherwise the default Playdate fonts will be used.\nEscaping styling characters\nTo draw an asterisk or underscore, use a double-asterisk or double-underscore. Styles may not be nested, but double-characters can be used inside of a styled portion of text.\nFor a complete set of characters allowed in `text`, see playdate.graphics.font. In addition, the newline character \\n is allowed and works as expected.\nAvoiding styling\nUse playdate.graphics.font:drawText(), which doesn’t support formatted text.\nInverting text color\nTo draw white-on-black text (assuming the font you are using is defined in the standard black-on-transparent manner), first call playdate.graphics.setImageDrawMode(playdate.graphics.kDrawModeFillWhite), followed by the appropriate drawText() call. setImageDrawMode() affects how text is rendered because characters are technically images.\nEquivalent to playdate->graphics->drawText() in the C API.',
            returns = "((number, number)))",
            type = "function"
          },
          drawTextAligned = {
            args = "(text: string, x: number, y: number, alignment: pd_text_alignment, leadingAdjustment?: number))",
            description = "You must import `CoreLibs/graphics` to use this function.\nDraws the string `text` aligned to the left, right, or centered on the `x` coordinate. Pass one of `kTextAlignment.left`, `kTextAlignment.center`, `kTextAlignment.right` for the `alignment` parameter.\nFor text formatting options, see drawText()\nTo draw unstyled text using a single font, see playdate.graphics.font:drawTextAligned()",
            returns = "(fun(text: string, x: number, y: number, alignment: pd_text_alignment, leadingAdjustment?: number | nil)",
            type = "function"
          },
          drawTextInRect = {
            args = "(fun(text: string, x: number, y: number, width: number, height: number, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font): (number, number, boolean)) | (fun(text: string, rect: pd_rect, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font",
            description = "You must import `CoreLibs/graphics` to use these functions.\nDraws the text using the current font and font advance into the rect defined by (`x`, `y`, `width`, `height`) (or `rect`).\nIf `truncationString` is provided and the text cannot fit in the rect, `truncationString` will be appended to the last line.\n`alignment`, if provided, should be one of one of `kTextAlignment.left`, `kTextAlignment.center`, `kTextAlignment.right`. Pass nil for `leadingAdjustment` and `truncationString` if those parameters are not required.\n`font`, if provided, will cause the text to be drawn unstyled using font:drawText() rather than playdate.graphics.drawText() using the currently-set system fonts.\nFor text formatting options, see drawText()\nReturns `width`, `height`, `textWasTruncated`\n`width` and `height` indicate the size in pixels of the drawn text. These values may be smaller than the width and height specified when calling the function.\n`textWasTruncated` indicates if the text was truncated to fit within the specified rect.",
            returns = "((number, number, boolean)))",
            type = "function"
          },
          drawTriangle = {
            args = "(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number))",
            description = "Draws a triangle with vertices (`x1`, `y1`), (`x2`, `y2`), and (`x3`, `y3`).",
            returns = "(fun(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number))",
            type = "function"
          },
          fillCircleAtPoint = {
            args = "(fun(x: number, y: number, radius: number)) | (fun(p: pd_point, radius: number))",
            description = "Draws a filled circle at the point `(x, y)` (or `p`) with radius `radius`.",
            returns = "((fun(x: number, y: number, radius: number)) | (fun(p: pd_point, radius: number)))",
            type = "function"
          },
          fillCircleInRect = {
            args = "(fun(x: number, y: number, width: number, height: number)) | (fun(r: pd_rect))",
            description = "Draws a filled circle in the rect `r` or the rect with origin `(x, y)` and size `(width, height)`.\nIf the rect is not a square, the circle will be drawn centered in the rect.",
            returns = "((fun(x: number, y: number, width: number, height: number)) | (fun(r: pd_rect)))",
            type = "function"
          },
          fillEllipseInRect = {
            args = "(fun(x: number, y: number, width: number, height: number, startAngle?: number, endAngle?: number)) | (fun(rect: pd_rect, startAngle?: number, endAngle?: number))",
            description = "Draws a filled ellipse in the rect `r` or the rect with origin `(x, y)` and size `(width, height)`.\n`startAngle` and `endAngle`, if provided, should be in degrees (not radians), and will cause only the segment of the ellipse between `startAngle` and `endAngle` to be drawn.",
            returns = "((fun(x: number, y: number, width: number, height: number, startAngle?: number, endAngle?: number)) | (fun(rect: pd_rect, startAngle?: number, endAngle?: number) | nil)",
            type = "function"
          },
          fillPolygon = {
            args = "(fun(x1: number, y1: number, x2: number, y2: number, ...: number)) | (fun(p: pd_polygon))",
            description = "### Overload 1 ###\nFills the polygon specified by a list of x,y coordinates. An edge between the last vertex and the first is assumed.\nEquivalent to playdate->graphics->fillPolygon() in the C API.\n### Overload 2 ###\nFills the polygon specified by the playdate.geometry.polygon `p` with the currently selected color or pattern. The function throws an error if the polygon is not closed.",
            returns = "((fun(x1: number, y1: number, x2: number, y2: number, ...: number)) | (fun(p: pd_polygon)))",
            type = "function"
          },
          fillRect = {
            args = "(fun(x: number, y: number, width: number, height: number)) | (fun(r: pd_rect))",
            description = "Draws the filled rectangle `r` or the rect at (`x`, `y`) of the given width and height.\nEquivalent to playdate->graphics->fillRect() in the C API.",
            returns = "((fun(x: number, y: number, width: number, height: number)) | (fun(r: pd_rect)))",
            type = "function"
          },
          fillRoundRect = {
            args = "(fun(x: number, y: number, w: number, h: number, radius: number)) | (fun(r: pd_rect, radius: number))",
            description = "Draws a filled rectangle with rounded corners in the rect `r` or the rect with origin (`x`, `y`) and size (`w`, `h`).\n`radius` defines the radius of the corners.",
            returns = "((fun(x: number, y: number, w: number, h: number, radius: number)) | (fun(r: pd_rect, radius: number)))",
            type = "function"
          },
          fillTriangle = {
            args = "(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number))",
            description = "Draws a filled triangle with vertices (`x1`, `y1`), (`x2`, `y2`), and (`x3`, `y3`).\nEquivalent to playdate->graphics->fillTriangle() in the C API.",
            returns = "(fun(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number))",
            type = "function"
          },
          font = {
            childs = {
              kLanguageEnglish = {
                returns = "(pd_language)",
                type = "value"
              },
              kLanguageJapanese = {
                returns = "(pd_language)",
                type = "value"
              },
              new = {
                args = "(path: string)",
                description = "Returns a playdate.graphics.font object from the data at `path`. If there is no file at `path`, the function returns nil.",
                returns = "(pd_font)",
                type = "function"
              },
              newFamily = {
                args = "(fontPaths: pd_font_family_paths)",
                description = 'Returns a font family table from the font files specified in `fontPaths`. `fontPaths` should be a table with the following format:\nlocal fontPaths = {\n [playdate.graphics.font.kVariantNormal] = "path/to/normalFont",\n    [playdate.graphics.font.kVariantBold] = "path/to/boldFont",\n    [playdate.graphics.font.kVariantItalic] = "path/to/italicFont"\n}\nThe table returned is of the same format with font objects in place of the paths, and is appropriate to pass to the functions setFontFamily() and getTextSize().',
                returns = "(pd_font_family)",
                type = "function"
              }
            },
            type = "class"
          },
          generateQRCode = {
            args = "(stringToEncode: string, desiredEdgeDimension: number, callback: fun(image: pd_image))",
            description = "You must import `CoreLibs/qrcode` to use this function.\nThis function uses playdate.timer internally, so be sure to call playdate.timer.updateTimers() in your main playdate.update() function, otherwise the callback will never be invoked.\nAsynchronously returns an image representing a QR code for the passed-in string to the function callback. The arguments passed to the callback are `image`, `errorMessage`. (If an `errorMessage` string is returned, `image` will be nil.)\ndesiredEdgeDimension lets you specify an approximate edge dimension in pixels for the desired QR code, though the function has limited flexibility in sizing QR codes, based on the amount of information to be encoded, and the restrictions of a 1-bit screen. The function will attempt to generate a QR code `smaller` than desiredEdgeDimension if possible. (Note that QR codes always have the same width and height.)\nIf you specify nil for desiredEdgeDimension, the returned image will balance small size with easy readability. If you specify 0, the returned image will be the smallest possible QR code for the specified string.\ngenerateQRCode() will return a reference to the timer it uses to run asynchronously. If you wish to stop execution of the background process generating the QR code, call :remove() on that returned timer.\nIf you know ahead of time what data you plan to encode, it is much faster to pre-generate the QR code, store it as a .png file in your game, and draw the .png at runtime. You can use playdate.simulator.writeToFile() to create this .png file.",
            returns = "(pd_timer)",
            type = "function"
          },
          getBackgroundColor = {
            args = "()",
            description = "Gets the color used for drawing the background, if necessary, before playdate.graphics.sprites are drawn on top.",
            returns = "(pd_color)",
            type = "function"
          },
          getClipRect = {
            args = "()",
            description = "getClipRect() returns multiple values (`x`, `y`, `width`, `height`) giving the current clipping rectangle.",
            returns = "(pd_rect)",
            type = "function"
          },
          getColor = {
            args = "()",
            description = "Gets the current drawing color for primitives.",
            returns = "(pd_color)",
            type = "function"
          },
          getDisplayImage = {
            args = "()",
            description = 'Returns a copy the contents of the `last completed frame`, i.e., a "screenshot", as a playdate.graphics.image.\nDisplay functions like setMosaic(), setInverted(), setScale(), and setOffset() do not affect the returned image.',
            returns = "(pd_image)",
            type = "function"
          },
          getDrawOffset = {
            args = "()",
            description = "getDrawOffset() returns multiple values (`x`, `y`) giving the current draw offset.",
            returns = "((number, number))",
            type = "function"
          },
          getFont = {
            args = "(variant?: pd_font_variant)",
            description = "Returns the current font, a playdate.graphics.font.",
            returns = "(pd_font)",
            type = "function"
          },
          getFontTracking = {
            args = "()",
            description = "Gets the global font tracking (spacing between letters) in pixels.",
            returns = "(number)",
            type = "function"
          },
          getImageDrawMode = {
            args = "()",
            description = "Gets the current drawing mode for images.",
            returns = "(pd_image)",
            type = "function"
          },
          getLineWidth = {
            args = "()",
            description = "Gets the current line width.",
            returns = "(number)",
            type = "function"
          },
          getLocalizedText = {
            args = "(key: string, language?: pd_language)",
            description = 'Returns a string found by doing a lookup of `key` in the .strings file corresponding to the current system language, or `language`, if specified.\nThe optional `language` argument can be one of the strings "en", "jp", or one of the constants:\n`playdate.graphics.font.kLanguageEnglish`\n`playdate.graphics.font.kLanguageJapanese`\nFor more information about localization and strings files, see the Localization section.',
            returns = "(string)",
            type = "function"
          },
          getScreenClipRect = {
            args = "()",
            description = "Returns the clip rect as in getClipRect(), but using screen coordinates instead of world coordinates.",
            returns = "(pd_rect)",
            type = "function"
          },
          getStrokeLocation = {
            args = "()",
            description = "Gets the current stroke position.",
            returns = "(pd_stroke_location)",
            type = "function"
          },
          getSystemFont = {
            args = "(variant?: pd_font_variant)",
            description = 'Like getFont() but returns the system font rather than the currently set font.\n`variant` should be one of the strings "normal", "bold", or "italic", or one of the constants:\n`playdate.graphics.font.kVariantNormal`\n`playdate.graphics.font.kVariantBold`\n`playdate.graphics.font.kVariantItalic`',
            returns = "(pd_font)",
            type = "function"
          },
          getTextSize = {
            args = "(str: string, fontFamily?: pd_font_family, leadingAdjustment?: number)",
            description = "Returns multiple values `(width, height)` giving the dimensions required to draw the text `str` using drawText(). Newline characters (\\n) are respected.\n`fontFamily` should be a table of fonts using keys as specified in setFontFamily(fontFamily). If provided, fonts from `fontFamily` will be used for calculating the size of `str` instead of the currently set font.",
            returns = "((number, number))",
            type = "function"
          },
          getTextSizeForMaxWidth = {
            args = "(text: string, maxWidth: number, leadingAdjustment?: number, font?: pd_font)",
            description = "You must import `CoreLibs/graphics` to use this function.\nReturns `width`, `height` which indicate the minimum size required for `text` to be drawn using drawTextInRect(). The `width` returned will be less than or equal to `maxWidth`.\n`font`, if provided, will cause the text size to be calculated without bold or italic styling using the specified font.",
            returns = "((number, number))",
            type = "function"
          },
          getWorkingImage = {
            args = "()",
            description = "Returns a copy the contents of the working frame buffer — `the current frame, in-progress` — as a playdate.graphics.image.\nDisplay functions like setMosaic(), setInverted(), setScale(), and setOffset() do not affect the returned image.",
            returns = "(pd_image)",
            type = "function"
          },
          image = {
            childs = {
              kDitherTypeAtkinson = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeBayer2x2 = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeBayer4x4 = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeBayer8x8 = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeBurkes = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeDiagonalLine = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeFloydSteinberg = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeHorizontalLine = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeNone = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeScreen = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              kDitherTypeVerticalLine = {
                returns = "(pd_dither_type)",
                type = "value"
              },
              new = {
                args = "(fun(width: number, height: number, bgcolor?: pd_color): pd_image) | (fun(path: string",
                description = "### Overload 1 ###\nCreates a new blank image of the given width and height. The image can be drawn on using playdate.graphics.pushContext() or playdate.graphics.lockFocus(). The optional `bgcolor` argument is one of the color constants as used in playdate.graphics.setColor(), defaulting to `kColorClear`.\n### Overload 2 ###\nReturns a playdate.graphics.image object from the data at `path`. If there is no file at `path`, the function returns nil and a second value describing the error.",
                returns = "(pd_image))",
                type = "function"
              }
            },
            type = "class"
          },
          imageSizeAtPath = {
            args = "(path: string)",
            description = "Returns the pair (`width`, `height`) for the image at `path` without actually loading the image.",
            returns = "((number, number))",
            type = "function"
          },
          imageWithText = {
            args = "(text: string, maxWidth: number, maxHeight: number, backgroundColor?: pd_color, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font)",
            description = "You must import `CoreLibs/graphics` to use this function.\nGenerates an image containing `text`. This is useful if you need to redraw the same text frequently.\n`maxWidth` and `maxHeight` specify the maximum size of the returned image.\n`backgroundColor`, if specified, will cause the image’s background to be one of `playdate.graphics.kColorWhite`, `playdate.graphics.kColorBlack`, or `playdate.graphics.kColorClear`.\n`font`, if provided, will cause the text to be drawn without bold or italic styling using the specified font.\nThe remaining arguments are the same as those in drawTextInRect().\nReturns `image`, `textWasTruncated`\n`image` is a newly-created image containing the specified text, or nil if an image could not be created. The image’s dimensions may be smaller than `maxWidth`, `maxHeight`.\n`textWasTruncated` indicates if the text was truncated to fit within the specified width and height.",
            returns = "((pd_image, boolean))",
            type = "function"
          },
          imagetable = {
            childs = {
              new = {
                args = "(fun(path: string): pd_imagetable) | (fun(count: number, cellsWide?: number, cellSize?: number",
                description = '### Overload 1 ###\nReturns a playdate.graphics.imagetable object from the data at `path`. If there is no file at `path`, the function returns nil and a second value describing the error. If the file at `path` is an animated GIF, successive frames of the GIF will be loaded as consecutive bitmaps in the imagetable. Any timing data in the animated GIF will be ignored.\nTo load a matrix image table defined in frames-table-16-16.png, you call playdate.graphics.imagetable.new("frames").\nTo load a sequential image table defined with the files frames-table-1.png, frames-table-2.png, etc., you call playdate.graphics.imagetable.new("frames").\n### Overload 2 ###\nReturns an empty image table for loading images into via imagetable:load() or setting already-loaded images into with imagetable:setImage(). If set, `cellsWide` is used to locate images by x,y position. The optional `cellSize` argument gives the allocation size for the images, if load() will be used. (This is a weird technical detail, so ask us if you need guidance here.)',
                returns = "(pd_imagetable))",
                type = "function"
              }
            },
            type = "class"
          },
          kAlignCenter = {
            returns = "(pd_text_alignment)",
            type = "value"
          },
          kAlignLeft = {
            returns = "(pd_text_alignment)",
            type = "value"
          },
          kAlignRight = {
            returns = "(pd_text_alignment)",
            type = "value"
          },
          kColorBlack = {
            returns = "(pd_color)",
            type = "value"
          },
          kColorClear = {
            returns = "(pd_color)",
            type = "value"
          },
          kColorWhite = {
            returns = "(pd_color)",
            type = "value"
          },
          kColorXOR = {
            returns = "(pd_color)",
            type = "value"
          },
          kDrawModeBlackTransparent = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kDrawModeCopy = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kDrawModeFillBlack = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kDrawModeFillWhite = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kDrawModeInverted = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kDrawModeNXOR = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kDrawModeWhiteTransparent = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kDrawModeXOR = {
            returns = "(pd_draw_mode)",
            type = "value"
          },
          kImageFlippedX = {
            returns = "(pd_image_flip)",
            type = "value"
          },
          kImageFlippedXY = {
            returns = "(pd_image_flip)",
            type = "value"
          },
          kImageFlippedY = {
            returns = "(pd_image_flip)",
            type = "value"
          },
          kImageUnflipped = {
            returns = "(pd_image_flip)",
            type = "value"
          },
          kLineCapStyleButt = {
            returns = "(pd_line_cap_style)",
            type = "value"
          },
          kLineCapStyleRound = {
            returns = "(pd_line_cap_style)",
            type = "value"
          },
          kLineCapStyleSquare = {
            returns = "(pd_line_cap_style)",
            type = "value"
          },
          kPolygonFillEvenOdd = {
            returns = "(pd_polygon_fill_rule)",
            type = "value"
          },
          kPolygonFillNonZero = {
            returns = "(pd_polygon_fill_rule)",
            type = "value"
          },
          kStrokeCentered = {
            returns = "(pd_stroke_location)",
            type = "value"
          },
          kStrokeInside = {
            returns = "(pd_stroke_location)",
            type = "value"
          },
          kStrokeOutside = {
            returns = "(pd_stroke_location)",
            type = "value"
          },
          kVariantBold = {
            returns = "(pd_font_variant)",
            type = "value"
          },
          kVariantItalic = {
            returns = "(pd_font_variant)",
            type = "value"
          },
          kVariantNormal = {
            returns = "(pd_font_variant)",
            type = "value"
          },
          kWrapCharacter = {
            returns = "(pd_wrap_mode)",
            type = "value"
          },
          kWrapClip = {
            returns = "(pd_wrap_mode)",
            type = "value"
          },
          kWrapWord = {
            returns = "(pd_wrap_mode)",
            type = "value"
          },
          lockFocus = {
            args = "(image: pd_image))",
            description = "lockFocus() routes all drawing to the given playdate.graphics.image. playdate.graphics.unlockFocus() returns drawing to the frame buffer.\nIf you draw into an image with color set to `playdate.graphics.kColorClear`, those drawn pixels will be set to transparent. When you later draw the image into the framebuffer, those pixels will not be rendered, i.e., will act as transparent pixels in the image.\nplaydate.graphics.pushContext(`image`) will also allow offscreen drawing into an image, with the additional benefit of being able to save and restore the graphics state.",
            returns = "(fun(image: pd_image))",
            type = "function"
          },
          nineSlice = {
            childs = {
              new = {
                args = "(imagePath: string, innerX: number, innerY: number, innerWidth: number, innerHeight: number)",
                description = 'Returns a new 9 slice image from the image at imagePath with the stretchable region defined by other parameters. The arguments represent the origin and dimensions of the innermost ("center") slice.',
                returns = "(pd_nineSlice)",
                type = "function"
              }
            },
            type = "class"
          },
          perlin = {
            args = "(x: number, y: number, z: number, repeat: number, octaves?: number, persistence?: number)",
            description = "Returns the Perlin value (from 0.0 to 1.0) at position `(x, y, z)`.\nIf `repeat` is greater than 0, the pattern of noise will repeat at that point on all 3 axes.\n`octaves` is the number of octaves of noise to apply. Compute time increases linearly with each additional octave, but the results are a bit more organic, consisting of a combination of larger and smaller variations.\nWhen using more than one octave, `persistence` is a value from 0.0 - 1.0 describing the amount the amplitude is scaled each octave. The lower the value of `persistence`, the less influence each successive octave has on the final value.",
            returns = "(number)",
            type = "function"
          },
          perlinArray = {
            args = "(count: number, x: number, dx: number, y?: number, dy?: number, z?: number, dz?: number, repeat?: number, octaves?: number, persistence?: number)",
            description = "Returns an array of Perlin values at once, avoiding the performance penalty of calling `perlin()` multiple times in a loop.\nThe parameters are the same as `perlin()` except:\n`count` is the number of values to be returned.\n`dx`, `dy`, and `dz` are how far to step along the x, y, and z axes in each iteration.",
            returns = "(number[])",
            type = "function"
          },
          popContext = {
            args = "())",
            description = "Pops a graphics context off the context stack and restores its state.\nEquivalent to playdate->graphics->popContext() in the C API.",
            returns = "(fun())",
            type = "function"
          },
          pushContext = {
            args = "(image?: pd_image))",
            description = "Pushes the current graphics state to the context stack and creates a new context. If a playdate.graphics.image is given, drawing functions are applied to the image instead of the screen buffer.\nIf you draw into an image context with color set to `playdate.graphics.kColorClear`, those drawn pixels will be set to transparent. When you later draw the image into the framebuffer, those pixels will not be rendered, i.e., will act as transparent pixels in the image.\nplaydate.graphics.lockFocus(`image`) will reroute drawing into an image, without saving the overall graphics context.\nEquivalent to playdate->graphics->pushContext() in the C API.",
            returns = "(fun(image?: pd_image | nil)",
            type = "function"
          },
          setBackgroundColor = {
            args = "(color: pd_color))",
            description = "Sets the color used for drawing the background, if necessary, before playdate.graphics.sprites are drawn on top.\n`color` should be one of the constants:\n`playdate.graphics.kColorBlack`\n`playdate.graphics.kColorWhite`\n`playdate.graphics.kColorClear`\nUse `kColorClear` if you intend to draw behind sprites.\nEquivalent to playdate->graphics->setBackgroundColor() in the C API.",
            returns = "(fun(color: pd_color))",
            type = "function"
          },
          setClipRect = {
            args = "(fun(x: number, y: number, width: number, height: number)) | (fun(rect: pd_rect)) | (fun(rect: pd_rect))",
            description = "setClipRect() sets the clipping rectangle for all subsequent graphics drawing, including bitmaps. The argument can either be separate dimensions or a playdate.geometry.rect object. The clip rect is automatically cleared at the beginning of the playdate.update() callback. The function uses world coordinates; that is, the given rectangle will be translated by the current drawing offset. To use screen coordinates instead, use setScreenClipRect()\nEquivalent to playdate->graphics->setClipRect() in the C API.",
            returns = "((fun(x: number, y: number, width: number, height: number)) | (fun(rect: pd_rect)) | (fun(rect: pd_rect)))",
            type = "function"
          },
          setColor = {
            args = "(color: pd_color))",
            description = "Sets and gets the current drawing color for primitives.\n`color` should be one of the constants:\n`playdate.graphics.kColorBlack`\n`playdate.graphics.kColorWhite`\n`playdate.graphics.kColorClear`\n`playdate.graphics.kColorXOR`\nThis color applies to drawing primitive shapes such as lines and rectangles, not bitmap images.\nsetColor() and setPattern() / setDitherPattern() are mutually exclusive. Setting a color will overwrite a pattern, and vice versa.",
            returns = "(fun(color: pd_color))",
            type = "function"
          },
          setDitherPattern = {
            args = "(alpha: number, ditherType?: pd_dither_type))",
            description = "Sets the pattern used for drawing to a dithered pattern. If the current drawing color is white, the pattern is white pixels on a transparent background and (due to a bug) the `alpha` value is inverted: 1.0 is transparent and 0 is opaque. Otherwise, the pattern is black pixels on a transparent background and `alpha` 0 is transparent while 1.0 is opaque.\nThe optional `ditherType` argument is a dither type as used in playdate.graphics.image:blurredImage(), and should be an ordered dither type; i.e., line, screen, or Bayer.\nThe error-diffusing dither types Floyd-Steinberg (kDitherTypeFloydSteinberg), Burkes (kDitherTypeBurkes), and Atkinson (kDitherTypeAtkinson) are allowed but produce very unpredictable results here.",
            returns = "(fun(alpha: number, ditherType?: pd_dither_type | nil)",
            type = "function"
          },
          setDrawOffset = {
            args = "(x: number, y: number))",
            description = 'setDrawOffset(x, y) offsets the origin point for all drawing calls to `x`, `y` (can be negative). So, for example, if the offset is set to -20, -20, an image drawn at 20, 20 will appear at the origin (in the upper left corner.)\nThis is useful, for example, for centering a "camera" on a sprite that is moving around a world larger than the screen.\nThe `x` and `y` arguments to .setDrawOffset() are always specified in the original, unaltered coordinate system. So, for instance, repeated calls to playdate.graphics.setDrawOffset(-10, -10) will leave the draw offset unchanged. Likewise, .setDrawOffset(0, 0) will always "disable" the offset.\nIt can be useful to have operations sometimes ignore the draw offsets. For example, you may want to have the score or some other heads-up display appear onscreen apart from scrolling content. A sprite can be set to ignore offsets by calling playdate.graphics.sprite:setIgnoresDrawOffset(true). playdate.graphics.image:drawIgnoringOffsets() lets you render an image using screen coordinates.\nEquivalent to playdate->graphics->setDrawOffset() in the C API.',
            returns = "(fun(x: number, y: number))",
            type = "function"
          },
          setFont = {
            args = "(font: pd_font, variant?: pd_font_variant))",
            description = 'Sets the current font, a playdate.graphics.font.\n`variant` should be one of the strings "normal", "bold", or "italic", or one of the constants:\n`playdate.graphics.font.kVariantNormal`\n`playdate.graphics.font.kVariantBold`\n`playdate.graphics.font.kVariantItalic`\nIf no variant is specified, `kFontVariantNormal` is used.\nEquivalent to playdate->graphics->setFont() in the C API.',
            returns = "(fun(font: pd_font, variant?: pd_font_variant | nil)",
            type = "function"
          },
          setFontFamily = {
            args = "(fontFamily: pd_font_family))",
            description = "Sets multiple font variants at once. fontFamily should be a table using the following format:\nlocal fontFamily = {\n [playdate.graphics.font.kVariantNormal] = normal_font,\n    [playdate.graphics.font.kVariantBold] = bold_font,\n    [playdate.graphics.font.kVariantItalic] = italic_font\n}\nAll fonts and font variants need not be present in the table.",
            returns = "(fun(fontFamily: pd_font_family))",
            type = "function"
          },
          setFontTracking = {
            args = "(pixels: number))",
            description = "Sets the global font tracking (spacing between letters) in pixels. This value is added to the font’s own tracking value as specified in its .fnt file.\nSee playdate.graphics.font:setTracking to adjust tracking on a specific font.",
            returns = "(fun(pixels: number))",
            type = "function"
          },
          setImageDrawMode = {
            args = "(mode: pd_draw_mode))",
            description = "Sets the current drawing mode for images.\nThe draw mode applies to images and fonts (which are technically images). The draw mode does not apply to primitive shapes such as lines or rectangles.\nThe available options for `mode` (demonstrated by drawing a two-color background image first, setting the specified draw mode, then drawing the Crankin' character on top) are:\n`playdate.graphics.kDrawModeCopy`: Images are drawn exactly as they are (black pixels are drawn black and white pixels are drawn white)\n`playdate.graphics.kDrawModeWhiteTransparent`: Any white portions of an image are drawn transparent (black pixels are drawn black and white pixels are drawn transparent)\n`playdate.graphics.kDrawModeBlackTransparent`: Any black portions of an image are drawn transparent (black pixels are drawn transparent and white pixels are drawn white)\n`playdate.graphics.kDrawModeFillWhite`: All non-transparent pixels are drawn white (black pixels are drawn white and white pixels are drawn white)\n`playdate.graphics.kDrawModeFillBlack`: All non-transparent pixels are drawn black (black pixels are drawn black and white pixels are drawn black)\n`playdate.graphics.kDrawModeXOR`: Pixels are drawn inverted on white backgrounds, creating an effect where any white pixels in the original image will always be visible, regardless of the background color, and any black pixels will appear transparent (on a white background, black pixels are drawn white and white pixels are drawn black)\n`playdate.graphics.kDrawModeNXOR`: Pixels are drawn inverted on black backgrounds, creating an effect where any black pixels in the original image will always be visible, regardless of the background color, and any white pixels will appear transparent (on a black background, black pixels are drawn white and white pixels are drawn black)\n`playdate.graphics.kDrawModeInverted`: Pixels are drawn inverted (black pixels are drawn white and white pixels are drawn black)\nInstead of the above-specified constants, you can also use one of the following strings: \"copy\", \"inverted\", \"XOR\", \"NXOR\", \"whiteTransparent\", \"blackTransparent\", \"fillWhite\", or \"fillBlack\".\nEquivalent to playdate->graphics->setDrawMode() in the C API.",
            returns = "(fun(mode: pd_draw_mode))",
            type = "function"
          },
          setLineCapStyle = {
            args = "(style: pd_line_cap_style))",
            description = "Specifies the shape of the endpoints drawn by drawLine.\n`style` should be one of these constants:\n`playdate.graphics.kLineCapStyleButt`\n`playdate.graphics.kLineCapStyleRound`\n`playdate.graphics.kLineCapStyleSquare`\nEquivalent to playdate->graphics->setLineCapStyle() in the C API.",
            returns = "(fun(style: pd_line_cap_style))",
            type = "function"
          },
          setLineWidth = {
            args = "(width: number))",
            description = "Sets the width of the line for drawLine, drawRect, drawPolygon, and drawArc when a playdate.geometry.arc is passed as the argument. This value is saved and restored when pushing and popping the graphics context.",
            returns = "(fun(width: number))",
            type = "function"
          },
          setPattern = {
            args = "(pattern: pd_pattern))",
            description = 'Sets the 8x8 pattern used for drawing. The `pattern` argument is an array of 8 numbers describing the bitmap for each row; for example, `{ 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55 }` specifies a checkerboard pattern. An additional 8 numbers can be specified for an alpha mask bitmap.\nTo "un-set" a pattern, call setColor(). setColor() and setPattern() / setDitherPattern() are mutually exclusive. Setting a pattern will overwrite a color, and vice versa.\nplaydate.graphics.setPattern(image, [x, y])\nUses the given playdate.graphics.image to set the 8 x 8 pattern used for drawing. The optional `x`, `y` offset (default 0, 0) indicates the top left corner of the 8 x 8 pattern.',
            returns = "(fun(pattern: pd_pattern))",
            type = "function"
          },
          setPolygonFillRule = {
            args = "(rule: pd_polygon_fill_rule))",
            description = "Sets the winding rule for filling polygons, one of:\n`playdate.graphics.kPolygonFillNonZero`\n`playdate.graphics.kPolygonFillEvenOdd`\nSee https://en.wikipedia.org/wiki/Nonzero-rule for an explanation of the winding rule.",
            returns = "(fun(rule: pd_polygon_fill_rule))",
            type = "function"
          },
          setScreenClipRect = {
            args = "(fun(x: number, y: number, width: number, height: number)) | (fun(rect: pd_rect))",
            description = "Sets the clip rectangle as above, but uses screen coordinates instead of world coordinates—​that is, it ignores the current drawing offset.\nEquivalent to playdate->graphics->setScreenClipRect() in the C API.",
            returns = "((fun(x: number, y: number, width: number, height: number)) | (fun(rect: pd_rect)))",
            type = "function"
          },
          setStencilImage = {
            args = "(image: pd_image, tile?: boolean))",
            description = "Sets the current stencil to the given image. If `tile` is set, the the stencil will be tiled; in this case, the image width must be a multiple of 32 pixels.\nEquivalent to playdate->graphics->setStencilImage() in the C API.",
            returns = "(fun(image: pd_image, tile?: boolean | nil)",
            type = "function"
          },
          setStencilPattern = {
            args = "(fun(pattern: pd_pattern)) | (fun(row1: number, row2: number, row3: number, row4: number, row5: number, row6: number, row7: number, row8: number)) | (fun(level: number, ditherType?: pd_dither_type)) | (fun(eightRows: number[])) | (fun(pattern: pd_pattern))",
            description = "### Overload 1 ###\nSets a pattern to use for stenciled drawing, as an alternative to creating an image, drawing a pattern into the image, then using that in setStencilImage(). pattern should be a table of the form { row1, row2, row3, row4, row5, row6, row7, row8 }.\n### Overload 2 ###\nSets a pattern to use for stenciled drawing, as an alternative to creating an image, drawing a pattern into the image, then using that in setStencilImage().\n### Overload 3 ###\nSets the stencil to a dither pattern specified by `level` and optional `ditherType` (defaults to playdate.graphics.image.kDitherTypeBayer8x8).\n### Overload 4 ###\nSets the sprite’s stencil to the given pattern, tiled across the screen.\n### Overload 5 ###\nSets the sprite’s stencil to the given pattern, tiled across the screen. pattern should be a table of the form { row1, row2, row3, row4, row5, row6, row7, row8 }.",
            returns = "((fun(pattern: pd_pattern)) | (fun(row1: number, row2: number, row3: number, row4: number, row5: number, row6: number, row7: number, row8: number)) | (fun(level: number, ditherType?: pd_dither_type)) | (fun(eightRows: number[])) | (fun(pattern: pd_pattern) | nil)",
            type = "function"
          },
          setStrokeLocation = {
            args = "(location: pd_stroke_location))",
            description = "Specifies where the stroke is placed relative to the rectangle passed into drawRect.\n`location` is one of these constants:\n`playdate.graphics.kStrokeCentered`\n`playdate.graphics.kStrokeOutside`\n`playdate.graphics.kStrokeInside`\nThis value is saved and restored when pushing and popping the graphics context.",
            returns = "(fun(location: pd_stroke_location))",
            type = "function"
          },
          sprite = {
            childs = {
              addEmptyCollisionSprite = {
                args = "(fun(r: pd_rect)) | (fun(x: number, y: number, w: number, h: number))",
                description = "You must import `CoreLibs/sprites` to use this function.\nThis convenience function adds an invisible sprite defined by the rectangle `x`, `y`, `w`, `h` (or the playdate.geometry.rect `r`) for the purpose of triggering collisions. This is useful for making areas impassable, triggering an event when a sprite enters a certain area, and so on.",
                returns = "((fun(r: pd_rect)) | (fun(x: number, y: number, w: number, h: number)))",
                type = "function"
              },
              addSprite = {
                args = "(sprite: pd_sprite))",
                description = "Adds the given sprite to the display list, so that it is drawn in the current scene. Note that this is called with a period . instead of a colon :.",
                returns = "(fun(sprite: pd_sprite))",
                type = "function"
              },
              addWallSprites = {
                args = "(tilemap: pd_tilemap, emptyIDs: integer[], xOffset?: number, yOffset?: number)",
                description = 'You must import `CoreLibs/sprites` to use this function.\nThis convenience function automatically adds empty collision sprites necessary to restrict movement within a tilemap.\n`tilemap` is a playdate.graphics.tilemap.\n`emptyIDs` is an array of tile IDs that should be considered "passable" — in other words, not walls. Tiles with default IDs of 0 are treated as passable by default, so you do not need to include 0 in the array.\n`xOffset, yOffset` optionally indicate the distance the new sprites should be offset from (0,0).\nReturns an array-style table of the newly created sprites.\nCalling this function is effectively a shortcut for calling playdate.graphics.tilemap:getCollisionRects() and passing the resulting rects to addEmptyCollisionSprite().',
                returns = "(pd_sprite[])",
                type = "function"
              },
              allOverlappingSprites = {
                args = "()",
                description = "Returns an array of array-style tables, each containing two sprites that have overlapping collide rects. All sprite pairs that are have overlapping collide rects (taking the sprites' group and collides-with masks into consideration) are returned.\nAn example of iterating over the collisions array:\nlocal collisions = gfx.sprite.allOverlappingSprites()\nfor i = 1, #collisions do\n        local collisionPair = collisions[i]\n        local sprite1 = collisionPair[1]\n        local sprite2 = collisionPair[2]\n        -- do something with the colliding sprites\nend",
                returns = "(table<1|2,pd_sprite>[])",
                type = "function"
              },
              clearClipRectsInRange = {
                args = "(startz: number, endz: number))",
                description = "Clears sprite clip rects in the given z-index range.",
                returns = "(fun(startz: number, endz: number))",
                type = "function"
              },
              getAllSprites = {
                args = "()",
                description = "Returns an array of all sprites in the display list.",
                returns = "(pd_sprite[])",
                type = "function"
              },
              getAlwaysRedraw = {
                args = "()",
                description = 'Return’s the sprites "always redraw" flag.',
                returns = "(boolean)",
                type = "function"
              },
              kCollisionTypeBounce = {
                returns = "(pd_collision_type)",
                type = "value"
              },
              kCollisionTypeFreeze = {
                returns = "(pd_collision_type)",
                type = "value"
              },
              kCollisionTypeOverlap = {
                returns = "(pd_collision_type)",
                type = "value"
              },
              kCollisionTypeSlide = {
                returns = "(pd_collision_type)",
                type = "value"
              },
              new = {
                args = "(image_or_tilemap?: pd_image|pd_tilemap)",
                description = 'This class method (note the "." syntax rather than ":") returns a new sprite object. A previously-loaded image or tilemap object can be optionally passed-in.\nTo see your sprite onscreen, you will need to call :add() on your sprite to add it to the display list.',
                returns = "(pd_sprite)",
                type = "function"
              },
              performOnAllSprites = {
                args = "(f: fun(pd_sprite)))",
                description = "You must import `CoreLibs/sprites` to use this function.\nPerforms the function `f` on all sprites in the display list. `f` should take one argument, which will be a sprite.",
                returns = "(fun(f: fun(pd_sprite)))",
                type = "function"
              },
              querySpriteInfoAlongLine = {
                args = "(fun(x1: number, y1: number, x2: number, y2: number): (pd_line_collision_info[], integer)) | (fun(lineSegment: pd_lineSegment",
                description = "Similar to `querySpritesAlongLine()`, but instead of sprites returns an array of `collisionInfo` tables containing information about sprites intersecting the line segment, and `len`, which is the number of collisions found. If you don’t need this information, use `querySpritesAlongLine()` as it will be faster.\nEach `collisionInfo` table contains:\n`sprite`: the sprite being intersected by the segment.\n`entryPoint`: a point representing the coordinates of the first intersection between sprite and the line segment.\n`exitPoint`: a point representing the coordinates of the second intersection between sprite and the line segment.\n`ti1` & `ti2`: numbers between 0 and 1 which indicate how far from the starting point of the line segment the collision happened; t1 for the entry point, t2 for the exit point. This can be useful for things like having a laser cause more damage if the impact is close.",
                returns = "((pd_line_collision_info[], integer)))",
                type = "function"
              },
              querySpritesAlongLine = {
                args = "(fun(x1: number, y1: number, x2: number, y2: number): pd_sprite[]) | (fun(lineSegment: pd_lineSegment",
                description = "Returns all sprites with collision rects intersecting the line segment.",
                returns = "(pd_sprite[]))",
                type = "function"
              },
              querySpritesAtPoint = {
                args = "(fun(x: number, y: number): pd_sprite[]) | (fun(p: pd_point",
                description = "Returns all sprites with collision rects containing the point.",
                returns = "(pd_sprite[]))",
                type = "function"
              },
              querySpritesInRect = {
                args = "(fun(x: number, y: number, width: number, height: number): pd_sprite[]) | (fun(rect: pd_rect",
                description = "Returns all sprites with collision rects overlapping the rect.",
                returns = "(pd_sprite[]))",
                type = "function"
              },
              redrawBackground = {
                args = "())",
                description = "You must import `CoreLibs/sprites` to use this function.\nMarks the background sprite dirty, forcing the drawing callback to be run when playdate.graphics.sprite.update() is called.",
                returns = "(fun())",
                type = "function"
              },
              removeAll = {
                args = "())",
                description = "Removes all sprites from the global sprite list.",
                returns = "(fun())",
                type = "function"
              },
              removeSprite = {
                args = "(sprite: pd_sprite))",
                description = "Removes the given sprite from the display list. As with add()/addSprite(), note that this is called with a period . instead of a colon :.",
                returns = "(fun(sprite: pd_sprite))",
                type = "function"
              },
              setAlwaysRedraw = {
                args = "(flag: boolean))",
                description = "If set to true, causes all sprites to draw each frame, whether or not they have been marked dirty. This may speed up the performance of your game if the system’s dirty rect tracking is taking up too much time - for example if there are many sprites moving around on screen at once.",
                returns = "(fun(flag: boolean))",
                type = "function"
              },
              setBackgroundDrawingCallback = {
                args = "(drawCallback: fun(number, number, number, number)))",
                description = "You must import `CoreLibs/sprites` to use this function.\nA convenience function for drawing a background image behind your sprites.\n`drawCallback` is a routine you specify that implements your background drawing. The callback should be a function taking the arguments x, y, width, height, where `x, y, width, height` specify the region (in screen coordinates, not world coordinates) of the background region that needs to be updated.\nSome implementation details: setBackgroundDrawingCallback() creates a screen-sized sprite with a z-index set to the lowest possible value so it will draw behind other sprites, and adds the sprite to the display list so that it is drawn in the current scene. The background sprite ignores the drawOffset, and will not be automatically redrawn when the draw offset changes; use playdate.graphics.sprite.redrawBackground() if necessary in this case. `drawCallback` will be called from the newly-created background sprite’s playdate.graphics.sprite:draw() callback function and is where you should do your background drawing. This function returns the newly created playdate.graphics.sprite.",
                returns = "(fun(drawCallback: fun(number, number, number, number)))",
                type = "function"
              },
              setClipRectsInRange = {
                args = "(fun(x: number, y: number, width: number, height: number, startz: number, endz: number)) | (fun(rect: pd_rect, startz: number, endz: number))",
                description = "Sets the clip rect for sprites in the given z-index range.",
                returns = "((fun(x: number, y: number, width: number, height: number, startz: number, endz: number)) | (fun(rect: pd_rect, startz: number, endz: number)))",
                type = "function"
              },
              spriteCount = {
                args = "()",
                description = "Returns the number of sprites in the display list.",
                returns = "(number)",
                type = "function"
              },
              spriteWithText = {
                args = "(text: string, maxWidth: number, maxHeight: number, backgroundColor?: pd_color, leadingAdjustment?: number, truncationString?: string, alignment?: pd_text_alignment, font?: pd_font)",
                description = "You must import `CoreLibs/sprites` to use this function.\nA conveneince function that creates a sprite with an image of `text`, as generated by imageWithText().\nThe arguments are the same as those in imageWithText().\nReturns `sprite`, `textWasTruncated`\n`sprite` is a newly-created sprite with its image set to an image of the text specified. The sprite’s dimensions may be smaller than `maxWidth`, `maxHeight`.\n`textWasTruncated` indicates if the text was truncated to fit within the specified width and height.",
                returns = "((pd_sprite, boolean))",
                type = "function"
              },
              update = {
                args = "())",
                description = 'This class method (note the "." syntax rather than ":") calls the update() function on every sprite in the global sprite list and redraws all of the dirty rects.\nYou will generally want to call playdate.graphics.sprite.update() once in your playdate.update() method, to ensure that your sprites are updated and drawn during every frame. Failure to do so may mean your sprites will not appear onscreen.\nBe careful not confuse sprite.update() with sprite:update(): the former updates all sprites; the latter updates just the sprite being invoked.',
                returns = "(fun())",
                type = "function"
              }
            },
            type = "class"
          },
          tilemap = {
            childs = {
              new = {
                args = "()",
                description = "Creates a new tilemap object.",
                returns = "(pd_tilemap)",
                type = "function"
              }
            },
            type = "class"
          },
          unlockFocus = {
            args = "())",
            description = "After calling unlockFocus(), drawing is routed to the frame buffer.",
            returns = "(fun())",
            type = "function"
          },
          video = {
            childs = {
              new = {
                args = "(path: string)",
                description = "Returns a playdate.graphics.video object from the pdv file at `path`. If the file at `path` can’t be opened, the function returns nil.",
                returns = "(pd_video)",
                type = "function"
              }
            },
            type = "class"
          }
        },
        type = "class"
      },
      inputHandlers = {
        childs = {
          pop = {
            args = "())",
            description = "Pops the last input handler off of the stack.",
            returns = "(fun())",
            type = "function"
          },
          push = {
            args = "(handler: pd_input_handler, masksPreviousHandlers?: boolean))",
            description = "Pushes a new input handler onto the stack.\n`handler:` A table containing one or more custom input functions.\n`masksPreviousHandlers:` If true, input functions not defined in `handler` will not be called. If missing or false, the previously-pushed input handler tables will be searched for input functions missing from `handler`, cascading down to the default playdate table.",
            returns = "(fun(handler: pd_input_handler, masksPreviousHandlers?: boolean | nil)",
            type = "function"
          }
        },
        type = "class"
      },
      isCrankDocked = {
        args = "()",
        description = "Returns a boolean indicating whether or not the crank is folded into the unit.\nIf your game requires the crank and :isCrankDocked() is true, you can use a crank alert to notify the user that the crank should be extended.",
        returns = "(boolean)",
        type = "function"
      },
      isSimulator = {
        description = "This variable—not a function, so don’t invoke with `()`—it is set to 1 when running inside of the Simulator and is `nil` otherwise.",
        returns = "(boolean)",
        type = "value"
      },
      kButtonA = {
        returns = "(pd_button)",
        type = "value"
      },
      kButtonB = {
        returns = "(pd_button)",
        type = "value"
      },
      kButtonDown = {
        returns = "(pd_button)",
        type = "value"
      },
      kButtonLeft = {
        returns = "(pd_button)",
        type = "value"
      },
      kButtonRight = {
        returns = "(pd_button)",
        type = "value"
      },
      kButtonUp = {
        returns = "(pd_button)",
        type = "value"
      },
      keyPressed = {
        args = "nil | (fun(key: string))",
        description = "Lets you act on keyboard keypresses when running in the Simulator ONLY. These can be useful for adding debugging functions that can be enabled via your keyboard.\nIt is possible test a game on Playdate hardware and trap computer keyboard keypresses if you are using the Simulator’s Control Device with Simulator option.\nkey is a string containing the character pressed or released on the keyboard. Note that:\nThe key in question needs to have a textual representation or these functions will not be called. For instance, alphanumeric keys will call these functions; keyboard directional arrows will not.\nIf the keypress in question is already in use by the Simulator for another purpose (say, to control the d-pad or A/B buttons), these functions will not be called.\nIf `key` is an alphabetic character, the value will always be lowercase, even if the user deliberately typed an uppercase character.",
        returns = "(nil | (fun(key: string)))",
        type = "function"
      },
      keyReleased = {
        args = "nil | (fun(key: string))",
        description = "Lets you act on keyboard key releases when running in the Simulator ONLY. These can be useful for adding debugging functions that can be enabled via your keyboard.",
        returns = "(nil | (fun(key: string)))",
        type = "function"
      },
      keyboard = {
        childs = {
          hide = {
            args = "())",
            description = "Hides the keyboard.",
            returns = "(fun())",
            type = "function"
          },
          isVisible = {
            args = "()",
            description = "Returns true if the keyboard is currently being shown.",
            returns = "(boolean)",
            type = "function"
          },
          kCapitalizationNormal = {
            returns = "(pd_capitalization)",
            type = "value"
          },
          kCapitalizationSentences = {
            returns = "(pd_capitalization)",
            type = "value"
          },
          kCapitalizationWords = {
            returns = "(pd_capitalization)",
            type = "value"
          },
          keyboardAnimatingCallback = {
            args = "nil | (fun())",
            description = "If set, this function is called as the keyboard animates open or closed. Provided as a way to sync animations with the keyboard movement.",
            returns = "(nil | (fun()))",
            type = "function"
          },
          keyboardDidHideCallback = {
            args = "nil | (fun())",
            description = "If set, this function will be called when the keyboard has finished the hide animation.",
            returns = "(nil | (fun()))",
            type = "function"
          },
          keyboardDidShowCallback = {
            args = "nil | (fun())",
            description = "If set, this function will be called when the keyboard is finished the opening animation.",
            returns = "(nil | (fun()))",
            type = "function"
          },
          keyboardWillHideCallback = {
            args = "nil | (fun())",
            description = 'If set, this function will be called when the keyboard starts to close. A Boolean argument will be passed to the callback, true if the user selected "OK" close the keyboard, false otherwise.',
            returns = "(nil | (fun()))",
            type = "function"
          },
          left = {
            args = "()",
            description = "Returns the current x location of the left edge of the keyboard.",
            returns = "(number)",
            type = "function"
          },
          setCapitalizationBehavior = {
            args = "(behavior: pd_capitalization))",
            description = "`behavior` should be one of the constants `playdate.keyboard.kCapitalizationNormal`, `playdate.keyboard.kCapitalizationWords`, or `playdate.keyboard.kCapitalizationSentences`.\nIn the case of `playdate.keyboard.kCapitalizationWords`, the keyboard selection will automatically move to the upper case column after a space is entered. For `playdate.keyboard.kCapitalizationSentences` the selection will automatically move to the upper case column after a period and a space have been entered.",
            returns = "(fun(behavior: pd_capitalization))",
            type = "function"
          },
          show = {
            args = "(text?: string))",
            description = "Opens the keyboard, taking over input focus.\n`text`, if provided, will be used to set the initial text value of the keyboard.",
            returns = "(fun(text?: string | nil)",
            type = "function"
          },
          text = {
            description = "Access or set the text value of the keyboard.",
            returns = "(string)",
            type = "value"
          },
          textChangedCallback = {
            args = "nil | (fun())",
            description = "If set, this function will be called every time a character is entered or deleted.",
            returns = "(nil | (fun()))",
            type = "function"
          },
          width = {
            args = "()",
            description = "Returns the pixel width of the keyboard.",
            returns = "(number)",
            type = "function"
          }
        },
        type = "class"
      },
      leftButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the left direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      leftButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the left direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      math = {
        childs = {
          lerp = {
            args = "(min: number, max: number, t: number)",
            description = "Returns a number that is the linear interpolation between `min` and `max` based on `t`, where `t = 0.0` will return `min` and `t = 1.0` will return `max`.\nYou must import `CoreLibs/math` to use this function.",
            returns = "(number)",
            type = "function"
          }
        },
        type = "class"
      },
      menu = {
        childs = {
          item = {
            type = "class"
          }
        },
        type = "class"
      },
      metadata = {
        description = "The playdate.metadata table contains the values in the current game’s pdxinfo file, keyed by variable name. To retrieve the version number of the game, for example, you would use playdate.metadata.version.\nChanging values in this table at run time has no effect.",
        returns = "(pd_metadata)",
        type = "value"
      },
      pathfinder = {
        childs = {
          graph = {
            childs = {
              new = {
                args = "(nodeCount?: number, coordinates?: table<1|2, number>[])",
                description = "Returns a new empty playdate.pathfinder.graph object.\nIf nodeCount is supplied, that number of nodes will be allocated and added to the graph. Their IDs will be set from 1 to nodeCount.\ncoordinates, if supplied, should be a table containing tables of x, y values, indexed by node IDs. For example, {{10, 10}, {50, 30}, {20, 100}, {100, 120}, {160, 130}}.",
                returns = "(pd_graph)",
                type = "function"
              },
              new2DGrid = {
                args = "(width: number, height: number, allowDiagonals?: boolean, includedNodes?: integer[])",
                description = "Convenience function that returns a new playdate.pathfinder.graph object containing nodes for for each grid position, even if not connected to any other nodes. This allows for easier graph modification once the graph is generated. Weights for connections between nodes are set to 10 for horizontal and vertical connections and 14 for diagonal connections (if included), as this tends to produce nicer paths than using uniform weights. Nodes have their indexes set from 1 to `width` * `height`, and have their `x, y` values set appropriately for the node’s position.\n`width`: The width of the grid to be created.\n`height`: The height of the grid to be created.\n`allowDiagonals`: If true, diagonal connections will also be created.\n`includedNodes`: A one-dimensional array of length `width` * `height`. Each entry should be a 1 or a 0 to indicate nodes that should be connected to their neighbors and nodes that should not have any connections added. If not provided, all nodes will be connected to their neighbors.",
                returns = "(pd_graph)",
                type = "function"
              }
            },
            type = "class"
          },
          node = {
            type = "class"
          }
        },
        type = "class"
      },
      readAccelerometer = {
        args = "()",
        description = "If the accelerometer has been turned on with playdate.startAccelerometer(), returns the x, y, and z values from the accelerometer as a list. Positive x points right, positive y points to the bottom of the screen, and positive z points through the screen away from the viewer. For example, with the device held upright this function returns the values (0,1,0). With it flat on its back, it returns (0,0,1).",
        returns = "((number, number, number))",
        type = "function"
      },
      resetElapsedTime = {
        args = "())",
        description = "Resets the high-resolution timer.",
        returns = "(fun())",
        type = "function"
      },
      restart = {
        args = "(arg?: string))",
        description = "Reinitializes the Playdate runtime and restarts the currently running game. The optional string arg passed in is available after restart in playdate.argv as if it had been passed in on the command line when launching the simulator.",
        returns = "(fun(arg?: string | nil)",
        type = "function"
      },
      rightButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the right direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      rightButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the right direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      serialMessageReceived = {
        args = "nil | (fun(message: string))",
        description = "Called when a msg <text> command is received on the serial port. The text following the command is passed to the function as the string `message`.\nRunning !msg <message> in the simulator Lua console sends the command to the device if one is connected, otherwise it sends it to the game running in the simulator.",
        returns = "(nil | (fun(message: string)))",
        type = "function"
      },
      setAutoLockDisabled = {
        args = "(disable: boolean))",
        description = "`True` disables the 3 minute auto-lock feature. `False` re-enables it and resets the timer back to 3 minutes.\nAuto-lock will automatically be re-enabled when your game terminates.\nIf disabling auto-lock, developers should look for opportunities to re-enable auto-lock when appropriate. (For example, if your game is an MP3 audio player, auto-lock could be re-enabled when the user pauses the audio.)",
        returns = "(fun(disable: boolean))",
        type = "function"
      },
      setButtonQueueSize = {
        args = "(size: number))",
        description = "When set, button up/down events on the D pad and the A and B buttons are added to a list instead of simply polled at the beginning of a frame, allowing the code to handle multiple taps on a given button in a single frame. At the default 30 FPS, a queue size of 5 should be adequate. At lower frame rates/longer frame times, the queue size should be extended until all button presses are caught. Additionally, when the button queue is enabled the button callbacks listed below are passed the event time as an argument.",
        returns = "(fun(size: number))",
        type = "function"
      },
      setCollectsGarbage = {
        args = "(flag: boolean))",
        description = "If `flag` is false, automatic garbage collection is disabled and the game should manually collect garbage with Lua’s collectgarbage() function.",
        returns = "(fun(flag: boolean))",
        type = "function"
      },
      setCrankSoundsDisabled = {
        args = "(disable: boolean))",
        description = "`True` disables the default crank docking/undocking sound effects. `False` re-enables them. Useful if the crank sounds seem out-of-place in your game.\nWhen your game terminates, crank sounds will automatically be re-enabled.",
        returns = "(fun(disable: boolean))",
        type = "function"
      },
      setDebugDrawColor = {
        args = "(r: number, g: number, b: number, a: number))",
        description = "Sets the color of the playdate.debugDraw() overlay image. Values are in the range 0-1.",
        returns = "(fun(r: number, g: number, b: number, a: number))",
        type = "function"
      },
      setGCScaling = {
        args = "(min: number, max: number))",
        description = "When the amount of used memory is less than min (scaled from 0-1, as a percentage of total system memory), the system will only run the collector for the minimum GC time, as set by playdate.setGCScaling(), every frame. If the used memory is more than max, the system will spend all free time running the collector. Between the two, the time used by the garbage collector is scaled proportionally.\nFor example, if the scaling is set to a min of 0.4 and max of 0.7, and memory is half full, the collector will run for the minimum GC time plus 1/3 of whatever time is left before the next frame (because (0.5 - 0.4) / (0.7 - 0.4) = 1/3).\nThe default behavior is a scaling of (0.0, 1.0). If set to (0.0, 0.0), the system will use all available extra time each frame running GC.",
        returns = "(fun(min: number, max: number))",
        type = "function"
      },
      setMenuImage = {
        args = "(image: pd_image, xOffset?: number))",
        description = "While the game is paused it can optionally provide an image to be displayed alongside the System Menu. Use this function to set that image.\n`image` should be a 400 x 240 pixel playdate.graphics.image. All important content should be in the left half of the image in an area 200 pixels wide, as the menu will obscure the rest. The right side of the image will be visible briefly as the menu animates in and out.\nOptionally, `xOffset` can be provided which must be a number between 0 and 200 and will cause the menu image to animate to a position offset left by `xOffset` pixels as the menu is animated in.\nTo remove a previously-set menu image, pass nil for the `image` argument.",
        returns = "(fun(image: pd_image, xOffset?: number | nil)",
        type = "function"
      },
      setMinimumGCTime = {
        args = "(ms: number))",
        description = "Force the Lua garbage collector to run for at least `ms` milliseconds every frame, so that garbage doesn’t pile up and cause the game to run out of memory and stall in emergency garbage collection. The default value is 1 millisecond.\nIf your game isn’t generating a lot of garbage, it might be advantageous to set a smaller minimum GC time, granting more CPU bandwidth to your game.",
        returns = "(fun(ms: number))",
        type = "function"
      },
      setNewlinePrinted = {
        args = "(flag: boolean))",
        description = "`flag` determines whether or not the print() function adds a newline to the end of the printed text. Default is `true`.",
        returns = "(fun(flag: boolean))",
        type = "function"
      },
      setStatsInterval = {
        args = "(seconds: number))",
        description = "setStatsInterval() sets the length of time for each sample frame of runtime stats. Set `seconds` to zero to disable stats collection.",
        returns = "(fun(seconds: number))",
        type = "function"
      },
      shouldDisplay24HourTime = {
        args = "()",
        description = "Returns true if the user has set the 24-Hour Time preference in the Settings program.",
        returns = "(boolean)",
        type = "function"
      },
      simulator = {
        childs = {
          exit = {
            args = "())",
            description = "Quits the Playdate Simulator app.",
            returns = "(fun())",
            type = "function"
          },
          getURL = {
            args = "(url: string)",
            description = "Returns the contents of the URL `url` as a string.",
            returns = "(string)",
            type = "function"
          },
          writeToFile = {
            args = "(image: pd_image, path: string))",
            description = "Writes an image to a PNG file at the path specified. Only available on the Simulator.\n`path` represents a path on your development computer, not the Playdate filesystem. It’s recommended you prefix your path with ~/ to ensure you are writing to a writeable directory, for example, ~/myImageFile.png. Please include the .png file extension in your path name. Any directories in your path must already exist on your development computer in order for the file to be written.",
            returns = "(fun(image: pd_image, path: string))",
            type = "function"
          }
        },
        type = "class"
      },
      sound = {
        childs = {
          addEffect = {
            args = "(effect: pd_effect))",
            description = "Adds the given playdate.sound.effect to the default sound channel.",
            returns = "(fun(effect: pd_effect))",
            type = "function"
          },
          bitcrusher = {
            childs = {
              new = {
                args = "()",
                description = "Creates a new bitcrusher filter.",
                returns = "(pd_bitcrusher)",
                type = "function"
              }
            },
            type = "class"
          },
          channel = {
            childs = {
              new = {
                args = "()",
                description = "Returns a new channel object and adds it to the global list.",
                returns = "(pd_channel)",
                type = "function"
              }
            },
            type = "class"
          },
          controlsignal = {
            childs = {
              new = {
                args = "()",
                description = "Creates a new control signal object, for automating effect parameters, channel pan and level, etc.",
                returns = "(pd_controlsignal)",
                type = "function"
              }
            },
            type = "class"
          },
          delayline = {
            childs = {
              new = {
                args = "(length: number)",
                description = "Creates a new delay line effect, with the given length (in seconds).",
                returns = "(pd_delayline)",
                type = "function"
              }
            },
            type = "class"
          },
          delaylinetap = {
            type = "class"
          },
          envelope = {
            childs = {
              new = {
                args = "(attack?: number, decay?: number, sustain?: number, release?: number)",
                description = "Creates a new envelope with the given (optional) parameters.",
                returns = "(pd_envelope)",
                type = "function"
              }
            },
            type = "class"
          },
          fileplayer = {
            childs = {
              new = {
                args = "(fun(buffersize?: number): pd_fileplayer) | (fun(path: string, buffersize?: number",
                description = "### Overload 1 ###\nReturns a fileplayer object, which can stream samples from disk. The file to play is set with the playdate.sound.fileplayer:load() function.\nIf given, `buffersize` specifies the size in seconds of the fileplayer’s data buffer. A shorter value reduces the latency of a playdate.sound.fileplayer:setOffset() call, but increases the chance of a buffer underrun.\n### Overload 2 ###\nReturns a fileplayer object for streaming samples from the file at `path`. Note that the file isn’t loaded until playdate.sound.fileplayer:play() or playdate.sound.fileplayer:setBufferSize() is called, in order to reduce initialization overhead.\nIf given, `buffersize` specifies the size in seconds of the fileplayer’s data buffer. A shorter value reduces the latency of a playdate.sound.fileplayer:setOffset() call, but increases the chance of a buffer underrun.",
                returns = "(pd_fileplayer))",
                type = "function"
              }
            },
            type = "class"
          },
          getCurrentTime = {
            args = "()",
            description = "Returns the current time, in seconds, as measured by the audio device. The audio device uses its own time base in order to provide accurate timing.\nEquivalent to playdate->sound->getCurrentTime() in the C API.",
            returns = "(number)",
            type = "function"
          },
          getHeadphoneState = {
            args = "(changeCallback: nil | (fun(boolean, boolean)))",
            description = "Returns a pair of booleans (headphone, mic) indicating whether headphones are plugged in, and if so whether they have a microphone attached. If `changeCallback` is a function, it will be called every time the headphone state changes, until it is cleared by calling playdate.sound.getHeadphoneState(nil). If a change callback is set, the audio does not automatically switch from speaker to headphones when headphones are plugged in (and vice versa), so the callback should use playdate.sound.setOutputsActive() to change the output if needed. The callback is passed two booleans, matching the return values from getHeadphoneState(): the first true if headphones are connect, and the second true if the headphones have a microphone.\nEquivalent to playdate->sound->getHeadphoneState() in the C API.",
            returns = "((boolean, boolean))",
            type = "function"
          },
          getSampleRate = {
            args = "()",
            description = "Returns the sample rate of the audio system (44100). The sample rate is determined by the hardware, and is not currently mutable.",
            returns = "(number)",
            type = "function"
          },
          instrument = {
            childs = {
              new = {
                args = "(synth?: pd_synth)",
                description = "Creates a new playdate.sound.instrument object. If synth is given, adds it as a voice for the instrument.",
                returns = "(pd_instrument)",
                type = "function"
              }
            },
            type = "class"
          },
          kFilterBandPass = {
            returns = "(pd_sound_filter)",
            type = "value"
          },
          kFilterHighPass = {
            returns = "(pd_sound_filter)",
            type = "value"
          },
          kFilterHighShelf = {
            returns = "(pd_sound_filter)",
            type = "value"
          },
          kFilterLowPass = {
            returns = "(pd_sound_filter)",
            type = "value"
          },
          kFilterLowShelf = {
            returns = "(pd_sound_filter)",
            type = "value"
          },
          kFilterNotch = {
            returns = "(pd_sound_filter)",
            type = "value"
          },
          kFilterPEQ = {
            returns = "(pd_sound_filter)",
            type = "value"
          },
          kFormat16bitMono = {
            returns = "(pd_sound_format)",
            type = "value"
          },
          kFormat16bitStereo = {
            returns = "(pd_sound_format)",
            type = "value"
          },
          kFormat8bitMono = {
            returns = "(pd_sound_format)",
            type = "value"
          },
          kFormat8bitStereo = {
            returns = "(pd_sound_format)",
            type = "value"
          },
          kLFOSampleAndHold = {
            returns = "(pd_lfo_type)",
            type = "value"
          },
          kLFOSawtoothDown = {
            returns = "(pd_lfo_type)",
            type = "value"
          },
          kLFOSawtoothUp = {
            returns = "(pd_lfo_type)",
            type = "value"
          },
          kLFOSine = {
            returns = "(pd_lfo_type)",
            type = "value"
          },
          kLFOSquare = {
            returns = "(pd_lfo_type)",
            type = "value"
          },
          kLFOTriangle = {
            returns = "(pd_lfo_type)",
            type = "value"
          },
          kWaveNoise = {
            returns = "(pd_waveform)",
            type = "value"
          },
          kWavePODigital = {
            returns = "(pd_waveform)",
            type = "value"
          },
          kWavePOPhase = {
            returns = "(pd_waveform)",
            type = "value"
          },
          kWavePOVosim = {
            returns = "(pd_waveform)",
            type = "value"
          },
          kWaveSawtooth = {
            returns = "(pd_waveform)",
            type = "value"
          },
          kWaveSine = {
            returns = "(pd_waveform)",
            type = "value"
          },
          kWaveSquare = {
            returns = "(pd_waveform)",
            type = "value"
          },
          kWaveTriangle = {
            returns = "(pd_waveform)",
            type = "value"
          },
          lfo = {
            childs = {
              new = {
                args = "(type?: pd_lfo_type)",
                description = "Returns a new LFO object, which can be used to modulate sounds. See playdate.sound.lfo:setType() for LFO types.",
                returns = "(pd_lfo)",
                type = "function"
              }
            },
            type = "class"
          },
          micinput = {
            childs = {
              getLevel = {
                args = "()",
                description = "Returns the current microphone input level, a value from 0.0 (quietest) to 1.0 (loudest).",
                returns = "(number)",
                type = "function"
              },
              getSource = {
                args = "()",
                description = 'Returns the current microphone input source, either "headset" or "device".',
                returns = "(string)",
                type = "function"
              },
              recordToSample = {
                args = "(buffer: pd_sample, completionCallback: fun(pd_sample))",
                description = "buffer should be a Sample created with the following code, with `secondsToRecord` replaced by a number specifying the record duration:\nlocal buffer = playdate.sound.sample.new(_secondsToRecord_, playdate.sound.kFormat16bitMono)\ncompletionCallback is a function called at the end of recording, when the buffer is full. It has one argument, the recorded sample. To override the device’s headset detection and force recording from either the internal mic or a headset mic or line in connected to a headset splitter, first call playdate.sound.micinput.startListening() with the required source. recordToSample() returns true on success, false on error.",
                returns = "(boolean)",
                type = "function"
              },
              startListening = {
                args = "(source?: string)",
                description = 'Starts monitoring the microphone input level. The optional `source` argument of "headset" or "device" causes the mic input to record from the given source. If no source is given, it uses the headset detection circuit to determine which source to use. The function returns the pair true and a string indicating which source it’s recording from on success, or false on error.',
                returns = "((boolean,string? | nil)",
                type = "function"
              },
              stopListening = {
                args = "())",
                description = "Stops monitoring the microphone input level.",
                returns = "(fun())",
                type = "function"
              },
              stopRecording = {
                args = "())",
                description = "Stops a sample recording started with recordToSample, if it hasn’t already reached the end of the buffer. The recording’s completion callback is called immediately.",
                returns = "(fun())",
                type = "function"
              }
            },
            type = "class"
          },
          onepolefilter = {
            childs = {
              new = {
                args = "()",
                description = "Returns a new one pole filter.",
                returns = "(pd_onepolefilter)",
                type = "function"
              }
            },
            type = "class"
          },
          overdrive = {
            childs = {
              new = {
                args = "()",
                description = "Creates a new overdrive effect.",
                returns = "(pd_overdrive)",
                type = "function"
              }
            },
            type = "class"
          },
          playingSources = {
            args = "()",
            description = "Returns a list of all sources currently playing.",
            returns = "(pd_source[])",
            type = "function"
          },
          removeEffect = {
            args = "(effect: pd_effect))",
            description = "Removes the given effect from the default sound channel.",
            returns = "(fun(effect: pd_effect))",
            type = "function"
          },
          resetTime = {
            args = "())",
            description = "Resets the audio output device time counter.",
            returns = "(fun())",
            type = "function"
          },
          ringmod = {
            childs = {
              new = {
                args = "()",
                description = "Creates a new ring modulator filter.",
                returns = "(pd_ringmod)",
                type = "function"
              }
            },
            type = "class"
          },
          sample = {
            childs = {
              new = {
                args = "(fun(path: string): pd_sample) | (fun(seconds: number, format?: pd_sound_format",
                description = "### Overload 1 ###\nReturns a new playdate.sound.sample object, with the sound data loaded in memory. If the sample can’t be loaded, the function returns nil and a second value containing the error.\n### Overload 2 ###\nReturns a new playdate.sound.sample object, with a buffer size of `seconds` in the given format. If `format` is not specified, it defaults to playdate.sound.kFormat16bitStereo. When used with playdate.sound.sample:load(), this allows you to swap in a different sample without re-allocating the buffer, which could lead to memory fragmentation.",
                returns = "(pd_sample))",
                type = "function"
              }
            },
            type = "class"
          },
          sampleplayer = {
            childs = {
              new = {
                args = "(fun(path: string): pd_sampleplayer) | (fun(sample: pd_sample",
                description = "### Overload 1 ###\nReturns a new playdate.sound.sampleplayer object, with the sound data loaded in memory. If the sample can’t be loaded, the function returns nil and a second value containing the error.\n### Overload 2 ###\nReturns a new playdate.sound.sampleplayer object for playing the given sample.",
                returns = "(pd_sampleplayer))",
                type = "function"
              }
            },
            type = "class"
          },
          sequence = {
            childs = {
              new = {
                args = "(midi_path?: string)",
                description = "Creates a new sound sequence. If midi_path is given, it attempts to load data from the midi file into the sequence.",
                returns = "(pd_sequence)",
                type = "function"
              }
            },
            type = "class"
          },
          setOutputsActive = {
            args = "(headphones: boolean, speaker: boolean))",
            description = "Forces sound to be played on the headphones or on the speaker, regardless of whether headphones are plugged in or not. (With the caveat that it is not actually possible to play on the headphones if they’re not plugged in.) This function has no effect in the Simulator.\nEquivalent to playdate->sound->setOutputsActive() in the C API.",
            returns = "(fun(headphones: boolean, speaker: boolean))",
            type = "function"
          },
          signal = {
            type = "class"
          },
          synth = {
            childs = {
              new = {
                args = "(fun(waveform?: pd_waveform): pd_synth) | (fun(sample: pd_sample, sustainStart?: number?, sustainEnd?: number?",
                description = "### Overload 1 ###\nReturns a new synth object to play a waveform or wavetable. See playdate.sound.synth:setWaveform for waveform values.\n### Overload 2 ###\nReturns a new synth object to play a Sample. Sample data must be uncompressed PCM, not ADPCM. An optional sustain region (measured in sample frames) defines a loop to play while the note is active. When the note ends, if an envelope has been set on the synth and the sustain range goes to the end of the sample (i.e. there’s no release section of the sample after the sustain range) then the sustain section continues looping during the envelope release; otherwise it plays through the end of the sample and stops. As a convenience, if sustainStart is greater than zero and sustainEnd isn’t given, it will be set to the length of the sample.",
                returns = "(pd_synth))",
                type = "function"
              }
            },
            type = "class"
          },
          track = {
            childs = {
              new = {
                args = "()",
                description = "Creates a new playdate.sound.track object.",
                returns = "(pd_track)",
                type = "function"
              }
            },
            type = "class"
          },
          twopolefilter = {
            childs = {
              new = {
                args = "(type: pd_sound_filter)",
                description = 'Creates a new two pole IIR filter of the given `type`:\n`playdate.sound.kFilterLowPass` (or the string "lowpass" or "lopass")\n`playdate.sound.kFilterHighPass` (or "highpass" or "hipass")\n`playdate.sound.kFilterBandPass` (or "bandpass")\n`playdate.sound.kFilterNotch` (or "notch")\n`playdate.sound.kFilterPEQ` (or "peq")\n`playdate.sound.kFilterLowShelf` (or "lowshelf" or "loshelf")\n`playdate.sound.kFilterHighShelf` (or "highshelf" or "hishelf")',
                returns = "(pd_twopolefilter)",
                type = "function"
              }
            },
            type = "class"
          }
        },
        type = "class"
      },
      start = {
        args = "())",
        description = "Resumes per-frame callbacks to playdate.update().",
        returns = "(fun())",
        type = "function"
      },
      startAccelerometer = {
        args = "())",
        description = "The accelerometer is off by default, to save a bit of power. If you will be using the accelerometer in your game, you’ll first need to call playdate.startAccelerometer() then wait for the next update cycle before reading its values. If you won’t be using the accelerometer again for a while, calling playdate.stopAccelerometer() will put it back into a low-power idle state.",
        returns = "(fun())",
        type = "function"
      },
      stop = {
        args = "())",
        description = "Stops per-frame callbacks to playdate.update(). Useful in conjunction with playdate.display.flush() if your program only does things in response to button presses.",
        returns = "(fun())",
        type = "function"
      },
      stopAccelerometer = {
        args = "())",
        description = "Puts the accelerometer into a low-power idle state. (Though, to be honest, the accelerometer draws so little power when it’s running you’d never notice the difference.)",
        returns = "(fun())",
        type = "function"
      },
      string = {
        childs = {
          UUID = {
            args = "(length: number))",
            description = "Generates a random string of uppercase letters",
            returns = "(fun(length: number))",
            type = "function"
          },
          trimLeadingWhitespace = {
            args = "(string: string)",
            description = "Returns a string with the whitespace removed from the beginning of `string`.",
            returns = "(string)",
            type = "function"
          },
          trimTrailingWhitespace = {
            args = "(string: string)",
            description = "Returns a string with the whitespace removed from the ending of `string`.",
            returns = "(string)",
            type = "function"
          },
          trimWhitespace = {
            args = "(string: string)",
            description = "Returns a string with the whitespace removed from the beginning and ending of `string`.",
            returns = "(string)",
            type = "function"
          }
        },
        type = "class"
      },
      timeFromEpoch = {
        args = "(seconds: number, milliseconds: number)",
        description = "Converts the epoch to a local date and time table, in the same format as the table returned by playdate.getTime().",
        returns = "(pd_time_table)",
        type = "function"
      },
      timer = {
        childs = {
          allTimers = {
            args = "()",
            description = 'Returns an array listing all running timers.\nNote the "." syntax rather than ":". This is a class method, not an instance method.',
            returns = "(pd_timer[])",
            type = "function"
          },
          keyRepeatTimer = {
            args = "(callback: fun(...), ...: any)",
            description = "Calls keyRepeatTimerWithDelay() below with standard values of `delayAfterInitialFiring` = 300 and `delayAfterSecondFiring` = 100.",
            returns = "(pd_timer)",
            type = "function"
          },
          keyRepeatTimerWithDelay = {
            args = "(delayAfterInitialFiring: number, delayAfterSecondFiring: number, callback: fun(...), ...: any)",
            description = "returns a timer that fires at key-repeat intervals. The function `callback` will be called immediately, then again after `delayAfterInitialFiring` milliseconds, then repeatedly at `delayAfterSecondFiring` millisecond intervals.",
            returns = "(pd_timer)",
            type = "function"
          },
          new = {
            args = "(fun(duration: number, callback: fun(...), ...: any): pd_timer) | (fun(duration: number, startValue?: number, endValue?: number, easingFunction?: (fun(number, number, number, number): number)",
            description = "### Overload 1 ###\nReturns a new playdate.timer that will run for `duration` milliseconds. `callback` is a function closure that will be called when the timer is complete.\nAccepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.\nBy default, timers start upon instantiation. To modify the behavior of a timer, see common timer methods and properties.\n### Overload 2 ###\nReturns a new playdate.timer that will run for `duration` milliseconds. If not specified, `startValue` and `endValue` will be 0, and a linear easing function will be used.\nBy default, timers start upon instantiation. To modify the behavior of a timer, see common timer methods and properties.",
            returns = "(pd_timer))",
            type = "function"
          },
          performAfterDelay = {
            args = "(delay: number, callback: fun(...), ...: any))",
            description = "Performs the function `callback` after `delay` milliseconds. Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.",
            returns = "(fun(delay: number, callback: fun(...), ...: any))",
            type = "function"
          },
          updateTimers = {
            args = "())",
            description = "This should be called from the main playdate.update() loop to drive the timers.",
            returns = "(fun())",
            type = "function"
          }
        },
        type = "class"
      },
      ui = {
        childs = {
          crankIndicator = {
            returns = "(pd_crankIndicator)",
            type = "value"
          },
          gridview = {
            childs = {
              new = {
                args = "(cellWidth: number, cellHeight: number)",
                description = "Returns a new playdate.ui.gridview with cells sized `cellWidth`, `cellHeight`. (Sizes are in pixels.) If cells should span the entire width of the grid (as in a list view), pass zero (0) for `cellWidth`.",
                returns = "(pd_gridview)",
                type = "function"
              }
            },
            type = "class"
          }
        },
        type = "class"
      },
      upButtonDown = {
        args = "nil | (fun())",
        description = "Called immediately after the player presses the up direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      upButtonUp = {
        args = "nil | (fun())",
        description = "Called immediately after the player releases the up direction on the d-pad.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      update = {
        args = "nil | (fun())",
        description = "Implement this callback and Playdate OS will call it once per frame. This is the place to put the main update-and-draw code for your game. Playdate will attempt to call this function by default 30 times per second; that value can be changed by calling playdate.display.setRefreshRate().\nIf your update() function takes too long to execute, Playdate OS may not be able to call it as often as specified by the current refresh rate. In this case, Playdate OS will simply try and call it as often as it can, with a not-to-exceed rate of playdate.display.getRefreshRate() frames per second.",
        returns = "(nil | (fun()))",
        type = "function"
      },
      wait = {
        args = "(milliseconds: number))",
        description = "Suspends callbacks to playdate.update() for the specified number of milliseconds.\nplaydate.wait() is ideal for pausing game execution to, for example, show a message to the player. Because .update() will not be called, the screen will freeze during .wait(). Audio will continue to play. Animation during this wait period is possible, but you will need to explicitly call playdate.display.flush() once per frame.\nWhile timers should pause during playdate.wait() (assuming playdate.timer.updateTimers() and playdate.frameTimer.updateTimers() are invoked during playdate.update()), animators will `not` pause during playdate.wait(). Be sure to account for this in your code.",
        returns = "(fun(milliseconds: number))",
        type = "function"
      }
    },
    type = "class"
  },
  table = {
    childs = {
      create = {
        args = "(arrayCount: number, hashCount: number)",
        description = "Returns a new Lua table with the array and hash parts preallocated to accommodate `arrayCount` and `hashCount` elements respectively.\nIf you can make a decent estimation of how big your table will need to be, table.create() can be much more efficient than the alternative, especially in loops. For example, if you know your array is always going to contain approximately ten elements, say myArray = table.create( 10, 0 ) instead of myArray = {}.",
        returns = "(table)",
        type = "function"
      },
      deepcopy = {
        args = "(source: table)",
        description = "deepcopy returns a deep copy of the `source` table. The copy will contain copies of any nested tables.",
        returns = "(table)",
        type = "function"
      },
      getsize = {
        args = "(table: table)",
        description = "Returns the size of the given table as multiple values (`arrayCount`, `hashCount`).",
        returns = "((number, number))",
        type = "function"
      },
      indexOfElement = {
        args = "(table: table, element: any)",
        description = "Returns the first index of `element` in the given array-style table. If the table does not contain `element`, the function returns nil.",
        returns = "(number | nil)",
        type = "function"
      },
      shallowcopy = {
        args = "(source: table, destination?: table)",
        description = "shallowcopy returns a shallow copy of the `source` table. If a `destination` table is provided, it copies the contents of `source` into `destination` and returns `destination`. The copy will contain references to any nested tables.",
        returns = "(table)",
        type = "function"
      }
    },
    type = "class"
  }
}