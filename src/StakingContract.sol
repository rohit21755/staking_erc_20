pragma solidity ^0.8.13;

contract StakingContract { 
    uint256 public totalStacked;
    mapping(address => uint256) public stackedBalances;
    mapping(address => uint256) public unclaimedRewards;
    mapping(address => uint256) public lastTimeUpdated;

    function stake() public payable {
        require(msg.value > 0, "cannot stake 0");
        totalStacked += msg.value;
        stackedBalances[msg.sender] += msg.value;
    }
    function unstake(uint256 amount) public {
        require(amount > 0);
        require(amount <= stackedBalances[msg.sender], "not enough balance");
        stackedBalances[msg.sender] -= amount;
        totalStacked -= amount;
        payable(msg.sender).transfer(amount);
    }
    function getRewads(address _address) public view returns(uint) {
        uint currentReward = unclaimedRewards[_address];
        uint lastUpdated = lastTimeUpdated[_address];
        uint newReward = (block.timestamp - lastUpdated) * stackedBalances[_address];
        return currentReward + newReward;
    }
    function claimRewards() public {
        uint currentReward = unclaimedRewards[_address];
        uint lastUpdated = lastTimeUpdated[_address];
        uint newReward = (block.timestamp - lastUpdated) * stackedBalances[_address];
        unclaimedRewards[msg.sender] += newReward;
        // mint them new tokens for them to claim
        // transfer them the new tokens + the current rewards

        unclaimedRewards[_address] = 0;
        lastTimeUpdated[_address] = block.timestamp;
    }
 }