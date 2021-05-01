package com.infoanalysis.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class PopulacaoDbUtil {

	private DataSource dataSource;

	public PopulacaoDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Populacao> getPopulacao() throws Exception {
		List<Populacao> populacao = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			myConn = dataSource.getConnection();
			String sql = "select * from populacao1";
			
			myStmt = myConn.createStatement();
			
			myRs = myStmt.executeQuery(sql);
			
			while (myRs.next()) {
				int id = myRs.getInt("id");
				String uf = myRs.getString("uf");
				String municipios = myRs.getString("municipios");
				int total = myRs.getInt("total");
				int homens = myRs.getInt("homens");
				int mulheres = myRs.getInt("mulheres");
				int populacaocedida = myRs.getInt("populacaocedida");
					
				Populacao tempPopulacao = new Populacao(id, uf, municipios, total,
						homens, mulheres, populacaocedida);
				
				populacao.add(tempPopulacao);
			}
			
			return populacao;

		} finally {
			close(myConn, myRs, myStmt);
		}

	}
	
	
	
	
	
	public List<Populacao> getPopulacaoPorEstado() throws Exception {
		List<Populacao> populacao = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			myConn = dataSource.getConnection();
			String sql = "select sum(total) total,uf from populacao1 group by UF";
			
			myStmt = myConn.createStatement();
			
			myRs = myStmt.executeQuery(sql);
			
			while (myRs.next()) {
				String uf = myRs.getString("uf");
				int total = myRs.getInt("total");
					
				Populacao tempPopulacao = new Populacao(uf, total);
				
				populacao.add(tempPopulacao);
			}
			
			return populacao;

		} finally {
			close(myConn, myRs, myStmt);
		}

	}
	
	public List<Populacao> getMulheresPorEstado() throws Exception {
		List<Populacao> populacao = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			myConn = dataSource.getConnection();
			String sql = "select sum(mulheres) mulheres,uf from populacao1 group by UF";
			
			myStmt = myConn.createStatement();
			
			myRs = myStmt.executeQuery(sql);
			
			while (myRs.next()) {
				String uf = myRs.getString("uf");
				int mulheres = myRs.getInt("mulheres");
					
				Populacao tempPopulacao = new Populacao(uf,mulheres);
				
				populacao.add(tempPopulacao);
			}
			
			return populacao;

		} finally {
			close(myConn, myRs, myStmt);
		}

	}
	
	public List<Populacao> getHomensPorEstado() throws Exception {
		List<Populacao> homen = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			myConn = dataSource.getConnection();
			String sql = "select sum(homens) homens,uf from populacao1 group by UF";
			
			myStmt = myConn.createStatement();
			
			myRs = myStmt.executeQuery(sql);
			
			while (myRs.next()) {
				String uf = myRs.getString("uf");
				int homens = myRs.getInt("homens");
					
				Populacao tempHomens = new Populacao(uf, homens );
				
				homen.add(tempHomens);
			}
			
			return homen;

		} finally {
			close(myConn, myRs, myStmt);
		}

	}
	
	
	

	

	private void close(Connection myConn, ResultSet myRs, Statement myStmt) {

		try {
			if (myRs != null) {
				myRs.close();
			}
			if (myConn != null) {
				myConn.close();
			}
			if (myStmt != null) {
				myStmt.close();
			}
		} catch (Exception e) {
			
		}
	}
}
