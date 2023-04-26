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
