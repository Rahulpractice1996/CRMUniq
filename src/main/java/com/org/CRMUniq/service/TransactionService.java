package com.org.CRMUniq.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.CRMUniq.Repo.TransactionRepo;
import com.org.CRMUniq.model.Transactions;

@Service
public class TransactionService {
	@Autowired
	TransactionRepo Trepo;

	public Transactions saveActivity(Transactions t) {
		return Trepo.save(t);
	}

	public static String formatDateTime(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy - hh:mm a");
		return formatter.format(date);
	}

}
