**Purpose:** Extra Functionality; Extension Compatibility

**Description:**
Any character can be escaped so that it is interpreted literally.
The backlash (`\`) character is used to escape the subsequent character.
Functionally, the backslash is ignored and the next character is always interpreted literally.

In the base specification for example, the first colon character can be escaped to be part of the key instead of as the separator.

Escaping is particularly useful in combination with extensions that give certain characters special behvaior. 
Escaping such characters allows using them literally while still using their special functionality as part of an extension elsewhere.

**Created On**: May 15th, 2023

**Status:** Active

**Examples:** 
<table><tr>

<th>Original</th><th>XLE-4</th>

</tr><tr><td>

```java
OS              : Windows 7 Ultimate 64-bit
Path            : "C:\Program Files (x86)\My Program"
//The line below is interpreted incorrectly,
//since the first colon is the separator
C: Drive Alias  : F 
```  

</td><td>

```cpp 
#ext 4

OS              : Windows 7 Ultimate 64-bit
//Note how backslash itself must now be escaped
Path            : "C:\\Program Files (x86)\\My Program"
//The below line is now interpreted correctly
C\: Drive Alias : F 
```

</td></tr></table>

If, for example, we wanted to use [XLE-7 (Quoted Strings)](XLE%E2%80%907%EA%9E%89-Quoted-Strings) but still wanted to have literal double quotes,
we would now need to escape the double quote characters that are intended to be literal:

<table><tr><th>
XLE-4 and XLE-7
</th></tr><tr><td>

```cpp
#ext 4,7

OS              : "Windows 7 Ultimate 64-bit"
//In this example, we actually want quotes in the value, 
//but still want the surrounding quotes
Path            : "\"C:\\Program Files (x86)\\My Program\""
C\: Drive Alias : "F"
```
</td></tr></table>

<br/>

In the original, the result is not what we intend, since there's no way to interpret the first colon in the last line literally:
```cs
get<string>("OS") => Windows 7 Ultimate 64-bit
get<string>("Path") => "C:\Program Files (x86)\My Program"

get<string>("C") => Drive Alias : F
get<string>("C: Drive Alias") => { null }
```

With escaping however, the result is correct:
```cs
get<string>("OS") => Windows 7 Ultimate 64-bit
get<string>("Path") => "C:\Program Files (x86)\My Program"

get<string>("C") => { null }
get<string>("C: Drive Alias") => F
```