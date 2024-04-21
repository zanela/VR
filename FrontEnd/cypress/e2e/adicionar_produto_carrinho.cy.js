import faker from 'faker';

describe('Adicionar produto ao carrinho', () => {
  it('Deve adicionar um produto ao carrinho com sucesso', () => {
    // Acessar a home do portal web
    cy.visit('https://www.vr.com.br');

    // Verificar se a home foi carregada corretamente
    cy.url().should('include', 'www.vr.com.br');

    // Clicar no botão "Compre online" para navegar até a loja
    cy.get('[data-testid="link-cliente-rh"] > .lojavr-style-c-fHHJCv').click();

    // Verificar se a página da loja foi carregada corretamente
    cy.url().should('include', 'loja.vr.com.br');

    // Selecionar a opção "Cartões VR"
    cy.get('[data-testid="item-VR"]').click();

    // Verificar se a página de cartões VR foi carregada corretamente
    cy.url().should('include', 'loja.vr.com.br/cartoes');

    // Gerar uma quantidade aleatória de cartões do produto "Auto"
    const quantidade = faker.datatype.number({ min: 1, max: 5 });

    // Adicionar a quantidade de cartões do produto "Auto"
    cy.get('.product-item').contains('Auto').parent().find('input').type(quantidade);

    // Verificar se a quantidade de cartões foi inserida corretamente
    cy.get('.product-item').contains('Auto').parent().find('input').should('have.value', quantidade.toString());

    // Gerar um valor de crédito aleatório para o produto "Auto"
    const valorCredito = faker.finance.amount();

    // Digitar o valor de crédito para o produto "Auto"
    cy.get('#produto-auxilio-vr-mais-va-valor').type(valorCredito);

    // Verificar se o valor de crédito foi inserido corretamente
    cy.get('#produto-auxilio-vr-mais-va-valor').should('have.value', valorCredito);

    // Clicar no botão "Adicionar ao carrinho"
    cy.get('#btn-adicionar-carrinho-auxilio-vr-mais-va').click();

    // Verificar se o produto foi adicionado ao carrinho com sucesso
    cy.get('#btn-meu-carrinho > .fa-light').click();
    cy.contains('Auto').should('exist');
    cy.contains(valorCredito).should('exist');
    cy.contains(quantidade).should('exist');
  });
});
