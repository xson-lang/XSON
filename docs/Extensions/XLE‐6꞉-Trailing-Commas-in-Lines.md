**Purpose:** Convenience; JSON Compatibility

**Description:** 
A comma character can be placed after the end of any line.
Functionally, a comma at the end of a line is ignored.

This allows copy-pasting complex lists that have commas after every item 
(such as enums from C-like programming languages) with no modification.

**Created On**: May 15th, 2023

**Status:** Active

**Examples:** 

The below example demonstrates how, for example, a C++ enum can be seamlessly copied into an XSON object; 
The enum contents are unchanged.

Note that in this specific example, [XLE-2 (Equals as Key-Value Separator)](XLE%u20102%uA789-Equals-as-Key%u2010Value-Separator)
is needed due to C++'s syntax.
<table><tr>

<th>C++ Enum</th><th>XSON Object (with XLE-6 and XLE-2)</th>

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
#ext 6,2

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