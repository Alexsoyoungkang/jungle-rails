describe("Jungle home page", () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("Direct to a product page upon clicking", () => {
    cy.get('[alt="Cliff Collard"]').click();
  });

  it("Direct to the first product page upon clicking the first item", () => {
    cy.get('.products article').first().click();
  });

  it("Direct to the first product page upon clicking the first item", () => {
    cy.get('.products img').first().click();
  });

  it("Direct to the first and then second page upon clicking", () => {
    cy.get('.products article').first().next().click();
  });


})