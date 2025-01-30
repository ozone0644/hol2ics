# HOL to ICS Converter

This script converts a `.hol` holiday file into an `.ics` calendar file, which can be imported into calendar applications like Outlook or Google Calendar.

## Usage

1. Ensure the script is executable:
   ```sh
   chmod +x hol2ics.sh
   ```
2. Run the script with the input `.hol` file and desired output `.ics` file:
   ```sh
   ./hol2ics.sh input.hol output.ics
   ```

## Requirements
- A Unix-based system with Bash installed

## Example
Given a `holidays.hol` file, convert it to `holidays.ics` by running:
```sh
./hol2ics.sh holidays.hol holidays.ics
```

After conversion, import `holidays.ics` into your preferred calendar application.

## Notes
- The script ignores section headers in the `.hol` file.
- Dates are expected in the `YYYY/MM/DD` format.

## License
This script is open-source and free to use.

