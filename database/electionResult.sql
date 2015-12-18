

use onps ;


update Candidate set candidateStatus = true where pCode != 3 ;


insert into ElectionResult
(resultID , pCode , cityCode , candidateName , totalVotes )
select cID , pCode , cityCode , cName , votes 
from Candiate ;


insert into ElectionResult
(resultID , pCode , cityCode , candidateName ,electionYear ,totalVotes )
select cID , pCode , cityCode , cName , 2013 , votes 
from Candidate where candidateStatus = false ;


update electionResult set totalVotes = 2500 ;