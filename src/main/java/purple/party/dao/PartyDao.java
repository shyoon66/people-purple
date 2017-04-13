package purple.party.dao;

import purple.domain.Party;

public interface PartyDao {
	void saveParty(Party party);
	void updateParty(Party party);
	void deleteParty(Party party);
	Party findPartyByOid(int oid);
}
