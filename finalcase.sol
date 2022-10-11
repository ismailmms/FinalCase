pragma solidity ^0.6.6;

contract Voting{
    //Yeni oluşturulan veri türümüz üç öznitelikten oluşuyor. Bu, belirli bir adayı benzersiz bir şekilde tanımlar, adayın adına atıfta bulunur ve adayların kazandığı oyları gösterir.
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    
    mapping (uint => Candidate) public candidates;
    uint public candidatecount;
    mapping (address => bool) public citizen;
    
    constructor() public{
        addCandidate("Dogan");
        addCandidate("Okcuoglu");
        addCandidate("Babasan");
    }
    //Bu işlev aday eklemek için kullanılır. Herkesin aday eklememesi gerektiği için işlevin kapsamını private olarak belirliyoruz.
    function addCandidate(string memory _name) private{
        candidatecount++;
        candidates[candidatecount] = Candidate(candidatecount, _name, 0);
    }
    
    //Bu işlev esasında oylamayı işlemek için kullanılır. Oy kullananların zaten oy kullanıp kullanmadığını kontrol eder
    function vote(uint _candidateid) public{
        require(!citizen[msg.sender]);
        
        citizen[msg.sender] = true;
        candidates[_candidateid].voteCount ++;
        
    }
}