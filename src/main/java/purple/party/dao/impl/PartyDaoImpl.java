package purple.party.dao.impl;

import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import purple.domain.Party;
import purple.party.dao.PartyDao;

@Repository("partyDao")
public class PartyDaoImpl implements PartyDao {
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void saveParty(Party party) {
		sessionFactory.getCurrentSession().save(party);
	}

	public void updateParty(Party party) {
		sessionFactory.getCurrentSession().update(party);
	}

	public void deleteParty(Party party) {
		sessionFactory.getCurrentSession().delete(party);
	}

	public Party findPartyByOid(int oid) {
		Party party = (Party)sessionFactory.getCurrentSession().get(Party.class, oid);
		Hibernate.initialize(party); // 이 부분을 추가해주면 됨
		return party;
	}
}
