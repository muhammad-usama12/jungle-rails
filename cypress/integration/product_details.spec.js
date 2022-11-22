describe("Product Detail Page", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("Shows Product Details for Scented Blade", () => {
    cy.get(".products h1").first().click({ force: true });
  });
});
