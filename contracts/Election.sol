pragma solidity 0.5.16;

contract Election {

	//string public candidate;
	struct candidate {
		uint id;
		string name;
		uint votecount;
	}

	mapping(uint => candidate) public candidates;

	mapping(address => bool) public voters;

	uint public candidatesCount;

	function addcandidate(string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = candidate(candidatesCount, _name, 0);
	}
	
	function vote(uint _CandidateId) public {

		require(!voters[msg.sender]);

		require(_CandidateId > 0 && _CandidateId <= candidatesCount);

		voters[msg.sender] = true;

		candidates[_CandidateId].votecount++;
	}
	//constructor
	constructor () public {
		//candidate = "Candidate 1";
		addcandidate("AY");
		addcandidate("HY");
	}
}