pragma solidity ^0.5.0;
contract Election
{
    constructor() public
    {
        addCandidate("Sonali");
        addCandidate("Sahil");

    }
    struct Candidate
    {
        uint id;
        string name;
        uint voteCount;
    }
    // store accounts that have voted
    mapping(address => bool) public voters;

    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;
    
    function addCandidate(string memory m_name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, m_name, 0);

    }

    function vote(uint _candidateId) public{
        //require that they havent voted before
        require(!voters[msg.sender]);

        //require a valid candidate
        require(_candidateId>0 && _candidateId <= candidatesCount);

        //record that the voter has voted
        voters[msg.sender] = true;
        //update candidate vote count
        candidates[_candidateId].voteCount++;
    }
}