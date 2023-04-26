

'''
Dapp Uni walkthrough

'''

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

# finish our crowdfunding, self-destruct and send funds
@public # declare public
def finalize():
    assert block.timestamp >= self.deadline, "deadline not met (yet)"
    assert self.balance >= self.goal, "invalid balance"

    selfdestruct(self.beneficiary)

# make sure somebody gets paid
@public # declare it public
def refund():
    assert block.timestamp >= self.deadline and self.balance < self.goal

    ind: int128 = self.refundIndex

    for i in range(ind, ind + 30):
        if i >= self.nextFunderIndex:
            self.refundIndex = self.nextFunderIndex
            return

        send(self.funders[i].sender, self.funders[i].value)
        clear(self.funders[i])

    self.refundIndex = ind + 30
