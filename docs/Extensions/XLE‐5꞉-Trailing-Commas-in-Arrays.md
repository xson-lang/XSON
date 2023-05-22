**Purpose:** Convenience

**Description:** 
A comma character can be placed after the last element/item of an array. 
Functionally, the comma before the closing square bracket is simply ignored.

This has the main advantage of easing copy-pasting the same list item multiple times,
thus making editing lists easier, since modifying the last item in an array or list is no longer required.

These trailing commas also reduce [diffs](https://en.wikipedia.org/wiki/Diff) when a new item is added to the list.

Additionally, copy-pasting basic lists with trailing commas on all lines requires no modification to the list.


**Created On**: May 15th, 2023

**Status:** Active

**Examples:** 

In this example, each line within the array was copy-pasted where appropriate.
In the original however, the last line had to be modified
<table><tr>

<th>Python List</th><th>XSON Array</th><th>XSON Array (with XLE-5)</th>

</tr><tr><td>

```python
flags = [
    True,
    True,
    False,
    True,
    True,
    False,
    False,
    False,
    True,
    True,
    False,
    True,
    True,
    True,
    False,
    False,
    False,
    False,
]
```  

</td><td>

```yaml
flags: [
    True,
    True,
    False,
    True,
    True,
    False,
    False,
    False,
    True,
    True,
    False,
    True,
    True,
    True,
    False,
    False,
    False,
    //This line required modification
    False
]
```  

</td><td>

```yaml 
flags: [
    True,
    True,
    False,
    True,
    True,
    False,
    False,
    False,
    True,
    True,
    False,
    True,
    True,
    True,
    False,
    False,
    False,
    False,
]
```

</td></tr></table>

<br/>

The resulting array is the same regardless:
```cs
get<bool[]>("flags") = { 
    True,
    True,
    (etc..)
    False,
    False
}
```