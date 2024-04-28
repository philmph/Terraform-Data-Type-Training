# Simple Types

Available types are

- `string`
- `number`
- `bool`

## Overview

| Type     | Syntax for Elements | Type in Variables |
| -------- | ------------------- | ----------------- |
| `string` | `"string"`          | `string`          |
| `number` | `123`, `123.123`    | `number`          |
| `bool`   | `true`, `false`     | `bool`            |

## Key Take-Aways

- Terraform tries Type Conversion automatically if required

- `number` and `bool` can be converted to `string` and vice versa

- `number` is used for `integer` and also `float` numbers (f.e. `123` and `123.123`)

- If a variable / local has a value of `null` it will be ommited (not defined) when used for a parameter in a resource block

- If a variable / local has a value of `null` it will **not** be ommited when used for a parameter in a module block. Instead, the module is called with `null` as value for the parameter. The variable option `nullable = false` in the module can change this behaviour
