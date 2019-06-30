//solium-disable linebreak-style
pragma solidity ^0.5.0;

contract Election{
    
    //Modelling a Candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount; 
    }     
    //string public candidate;

    //Fetch Candidates
    mapping(uint=>Candidate) public candidates;

    mapping(address => bool) public voters;

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);
        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        // record that voter has voted
        voters[msg.sender] = true;
        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }

    //Store Candaidats Count
    uint public candidatesCount;

    function addCandidate(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount]=Candidate(candidatesCount,_name,0);        
    }
    constructor() public{
        addCandidate("Lalu");
        addCandidate("Nitish");
        addCandidate("Paswan");
    }


}  