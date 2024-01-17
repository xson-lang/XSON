**Purpose:** Convenience

**Description:** 
The Key-Value seperator can be omitted **when the value is an object or an array** (since the start of an object or array is already denoted without it).

**Created On**: May 15th, 2023

**Status:** Active

**Examples:**

<table><tr>

<th>Original</th><th>Max Omissions</th>

</tr><tr><td>

```yaml
servers: {
  alpha:   [10.0.0.2, My Home Server]
  bravo:   [10.0.0.7, My Work Server]
  charlie: [10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  }
}
```  

</td><td>

```yaml
servers {
  alpha  [10.0.0.2, My Home Server]
  bravo  [10.0.0.7, My Work Server]
  charlie[10.0.0.9, My Friend's Server]
  aux{
    // String values still need a separator
    os        : Ubuntu
    version   : 22.04 LTS
    start time: 14:03:59:10
  }
}
```  

</td></tr></table>