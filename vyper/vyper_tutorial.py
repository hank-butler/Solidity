'''
From ChatGPT
Solidity and Vyper are both programming languages used for
developing smart contracts on the Ethereum blockchain.

However, there are some differences between the two:
1. Syntax: Solidity has a syntax similar to JavaScript,
while Vyper's syntax is similar to Python.
Vyper is designed to have a more readable and concise syntax,
with a focus on security and simplicity.

2. Security: Vyper has a more restrictive syntax and fewer features than Solidity,
which makes it easier to write secure contracts.
Solidity, on the other hand, has a more extensive feature set,
which can make it more challenging to write secure code.
However, Solidity has a larger developer community,
which has contributed to the development of tools and libraries for improving security.

3. Gas Optimization: Vyper is designed to produce more efficient code than Solidity,
with a focus on reducing gas consumption.
This makes Vyper a better choice for contracts that require a lot of computation
 or that are expected to be used frequently.

4. Tooling: Solidity has a more extensive ecosystem of tools and libraries,
which can make it easier to develop and deploy contracts.
Vyper, on the other hand, has fewer tools available, but this is changing as it gains popularity.

In summary, Solidity is a more mature language with a larger developer community,
while Vyper is a newer language with a focus on security and gas optimization.
The choice between the two depends on the specific
needs of the project and the preferences of the developer.

'''

'''
From smart contract programmer
==============================

Let's start with a simple contract

If we were on our local machine, we would create an empty file

HelloWorld.vy



'''
# specify which version # Contract is only for this version, will not work with other versions
# @version ^0.2.0

# declaring a variable to stored on chain
greet: public(String[100])
# We'll flesh out contracts and Syntax
# Declarign a variable to stored, it's name is Greet, and it's a string
# maximum size is 100

# Next we'll initialize the greet message with "hello world!"
@external
def __init__():
    self.greet = "Hello World!"

# Let's compile it
# On local machine we'd type vyper and then the filepath to the file
# We'll do it on Remix


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
