**Purpose:** JSON Compatibility; Convenience

**Description:** 
A comma character can be placed after the end of any value.
Functionally, a comma at the end of a line is ignored.

This allows copy-pasting complex lists that have commas after every item 
(such as enums from C-like programming languages) with no modification.

This extension is required for JSON compatiblity, as JSON data has a comma after every value within an object.

**Created On**: May 15th, 2023

**Status:** Active

**Examples:** 

In addition to JSON compatiblity, this extension can be used for convenience purposes. 

The below example demonstrates how, for example, a C++ enum can be seamlessly copied into an XSON object; 
The enum contents are unchanged.

Note that in this specific example, [XLE-2 (${XLE-2_NAME})](${XLE-2_LINK})
is needed due to C++'s syntax.
<table><tr>

<th>C++ Enum</th><th>XSON Object (with XLE-5 and XLE-2)</th>

</tr><tr><td>

```cpp
#include <cstdint>

enum color : uint32_t {
    black = 0x0,
    blue = 0x0000FFFF, 
    green = 0x00FF00FF,
    red = 0xFF0000FF, 
    white = 0xFFFFFFFF,
};
```  

</td><td>

```cpp 
#ext 5,2

Colors: {
    black = 0x0,
    blue = 0x0000FFFF, 
    green = 0x00FF00FF,
    red = 0xFF0000FF, 
    white = 0xFFFFFFFF,
}
```

</td></tr></table>

<br/>

