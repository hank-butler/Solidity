# Check out simply open auction via vyper docs
# Set up state variables in contract:

struct Funder
    sender: address # eth address
    value: wei_value # what they contributed

# creating state variables

funders: map(int128, Funder)
nextFunderIndex: int128
beneficiary: address
deadline: public(timestamp) # access outside contract
goal: public(wei_value) # goal of the crowdfunding
refundIndex: int128
timelimit: public(timedelta) # last point in time to contribute to crowdfunding

# Constructor function for when contract is initialized
@public
# variable name, then data type
def __init__(_beneficiary: address, _goal: wei_value, _timelimit: timedelta):
    # set things inside constructor, assign state variables to these whenever contract is initialized
    self.beneficiary = _beneficiary
    self.deadline = block.timestamp + _timelimit
    self.timelimit = _timelimit
    self.goal = _goal

# new function for participating in crowdfunding
@public
@payable
def participate():
    assert block.timestamp < self.deadline, "deadline not met (yet)"
    # caching value to override in a second
    nfi: int128 = self.nextFunderIndex

    self.funders[nfi] = Funder({sender: msg.sender, value: msg.value})
    # set funder inside mapping and now incrementing
    self.nextFunder = nfi + 1
