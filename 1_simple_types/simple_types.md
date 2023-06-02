# Simple Types

Available types are

- `string`
- `number`
- `bool`

## Key Take-Aways

- `number` and `bool` can be converted to `string` and Vice Versa. Terraform tries Type Conversion automatically if required.
- `number` is used for `integer` and also `float` numbers (f.e. `123` and `123.123`).
- If a variable / local has a value of `null` it will be ommited (not defined) when used for a parameter (f.e. in a resource block). This is not possible for required parameters.

Examples for conversions and `null` are shown in [main.tf](./main.tf).
