package com.infoanalysis.jdbc;

public class Populacao {
	private int id;
	private String uf;
	private String municipios;
	private int total;
	private int homens;
	private int mulheres;
	private long populacaocedida;
	
	public Populacao(String uf,  int total) {
		this.uf = uf;
		this.total = total;

	}
		


	public Populacao(int id, String uf, String municipios, int total, int homens, int mulheres, long populacaocedida) {
		super();
		this.id = id;
		this.uf = uf;
		this.municipios = municipios;
		this.total = total;
		this.homens = homens;
		this.mulheres = mulheres;
		this.populacaocedida = populacaocedida;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getMunicipios() {
		return municipios;
	}

	public void setMunicipios(String municipios) {
		this.municipios = municipios;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getHomens() {
		return homens;
	}

	public void setHomens(int homens) {
		this.homens = homens;
	}

	public int getMulheres() {
		return mulheres;
	}

	public void setMulheres(int mulheres) {
		this.mulheres = mulheres;
	}

	public long getPopulacaocedida() {
		return populacaocedida;
	}

	public void setPopulacaocedida(long populacaocedida) {
		this.populacaocedida = populacaocedida;
	}

	@Override
	public String toString() {
		return "Populacao [id=" + id + ", uf=" + uf + ", municipios=" + municipios + ", total=" + total + ", homens="
				+ homens + ", mulheres=" + mulheres + ", populacaocedida=" + populacaocedida + "]";
	}
	
	
}
