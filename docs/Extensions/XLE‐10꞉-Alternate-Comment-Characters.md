**Purpose:** Extra Functionality; Convenience; INI Compatibility

**Description:** 
The hash symbol (`#`) and semicolon (`;`) can be used to start a comment.
Everything after these characters will be ignored by the parser.

They are direct alternatives for the default double slash (`//`) comment character.

**Created On**: May 18th, 2023

**Status:** Active

**Examples:** 

<table><tr>

<th>Original</th><th>Alternate</th>

</tr><tr><td>

```cpp
/* This is a
 * multi-line comment
 */

// This is a single line comment
```  

</td><td>

```yaml 
/* This is a
 * multi-line comment
 */

// This is a single line comment

# This is also a single line comment

; This is yet another single line comment
; This is a single line comment using the same symbol as the last line
```

</td></tr></table>

<br/>

The result is empty for both, since there is no actual data.