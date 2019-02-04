# BluecodeTest

## Run test client

1. mix phx.server
2. ruby test_client

## Use ChecksumCalculator API

#### GET /checksum
##### calculates checksum state for current state
```
```

### GET /checksum/digits
##### returns current state as array
```
allowed query params *?with_positions=true* - will number positions for current state
```


### POST /checksum/digits 
##### add digit
```
```

### PUT/PATCH /checksum/digits/:digit_position 
##### append digits to any existent position
```
```

### DELETE /checksum/digits 
##### clean current state
```
```


