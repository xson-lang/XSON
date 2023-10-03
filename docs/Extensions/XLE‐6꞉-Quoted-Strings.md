**Purpose:** JSON Compatibility; TOML Compatibility

**Description:** 
Keys and any string values can be surrounded in quotes (including values within arrays). 
Functionally, the first and last set of quotes around a key or value are ignored.
Note that they are only ignored if they are the beginning and end of a key or value, not in the middle of one

**Created On**: May 15th, 2023

**Status:** Active

**Examples:** 

<table><tr>

<th>Original</th><th>With Quotes</th>

</tr><tr><td>

```yaml
servers: {
  alpha:   [10.0.0.2, My Home Server]
  bravo:   [10.0.0.7, My Work Server]
  charlie: [10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    //Note the double quotes added here
    version   :  22.04 "LTS"
    start time:  14:03:59:10
  }
}
```  

</td><td>

```yaml 
"servers": {
  "alpha":   ["10.0.0.2", "My Home Server"]
  "bravo":   ["10.0.0.7", "My Work Server"]
  "charlie": ["10.0.0.9", "My Friend's Server"]
  "aux": {
    // You are not forced to always use quotes.
    // Although, this is not recommended for consistency reasons.
    "os"         : Ubuntu
    version      : "22.04 "LTS""
    "start time" : "14:03:59:10"
  }
}
```

</td></tr></table>

<br/>
Example Result (same for both):

```cs
get<string>("servers") => "
  alpha:  [10.0.0.2, My Home Server]
  bravo:  [10.0.0.7, My Work Server]
  charlie:[10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    version   :  22.04 "LTS"
    start time:  14:03:59:10
  }
"

get<string>("servers.alpha") => "[10.0.0.2, My Home Server]"
get<string[]>("servers.alpha") => { "10.0.0.2", "My Home Server" }

get<string>("servers.aux.os") => "22.04 "LTS""

get<TimeSpan>("servers.aux.start time") => { 14 Days, 3 Hours, 59 Minutes, and 10 Seconds }
```