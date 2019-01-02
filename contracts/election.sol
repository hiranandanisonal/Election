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

    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;
    
    function addCandidate(string memory m_name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, m_name, 0);

    }
}