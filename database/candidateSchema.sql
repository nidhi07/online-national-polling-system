create table Candidate(cID int(15),
                       voterIdentityNumber int(15) NOT NULL ,
					   cName varchar(60) NOT NULL ,
					   pCode int(5) NOT NULL,
					   cityCode int(5) NOT NULL,
					   currentPosition varchar(30) NOT NULL,
					   votes int(5) NOT NULL,
                       candidateStatus boolean default false ,
					   primary key(cID)
                       ) ;	
