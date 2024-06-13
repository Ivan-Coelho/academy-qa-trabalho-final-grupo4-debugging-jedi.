describe('Exclusão de Usuários', function () {
    var usuarioCriado;
    var usuarioExcluido;
    var token;
    var filmeCriado;

    before(function () {
        cy.criarUsuario().then((Criar) => {
            usuarioExcluido = newUser;
        });
    });

    beforeEach(function () {
        cy.createUser().then((newUser) => {
            usuarioCriado = newUser;
        });
    });

    it('Não deve ser possível realizar exclusão de uma conta, sem efetuar login ', function () {
        cy.request({
            method: 'DELETE',
            url: 'https://raromdb-3c39614e42d4.herokuapp.com/api/users/' + usuarioCriado.id,
            failOnStatusCode: false,
        }).then((response) => {
            expect(response.status).to.equal(401);
            expect(response.body.message).to.be.eq('Access denied.');
            expect(response.body.error).to.be.eq('Unauthorized');
        });
    });


    it('Não deve ser possível realizar exclusão de uma conta, sendo um usuário com perfil Comum', function () {
        cy.login(usuarioCriado).then((login) => {
            token = login.body.accessToken
        }).then(function () {
            cy.request({
                method: 'DELETE',
                url: 'https://raromdb-3c39614e42d4.herokuapp.com/api/users/' + usuarioCriado.id,
                failOnStatusCode: false,
            }).then((response) => {
                expect(response.status).to.equal(401);
                expect(response.body.message).to.be.eq('Access denied.');
                expect(response.body.error).to.be.eq('Unauthorized');
            });
        });
    });

    it('Não deve ser possível realizar exclusão de uma conta, sendo um usuário com perfil Crítico', function () {
        cy.login(usuarioCriado).then((login) => {
            token = login.body.accessToken
        }).then(function () {
            cy.promoteCritic(token).then(function () {
                cy.request({
                    method: 'DELETE',
                    url: 'https://raromdb-3c39614e42d4.herokuapp.com/api/users/' + usuarioCriado.id,
                    failOnStatusCode: false,
                }).then((response) => {
                    expect(response.status).to.equal(401);
                    expect(response.body.message).to.be.eq('Access denied.');
                    expect(response.body.error).to.be.eq('Unauthorized');
                });
            });
        });
    });

    it('Deve ser possível que um usuário com perfil Administrador, exclua a conta de outro usuário', function () {

        cy.login(usuarioCriado).then((login) => {
            token = login.body.accessToken
        }).then(function () {
            cy.promoteAdmin(token).then(function () {
                cy.request({
                    method: 'DELETE',
                    url: 'https://raromdb-3c39614e42d4.herokuapp.com/api/users/' + usuarioExcluido.id,
                    auth: {
                        bearer: token,
                    },
                }).then((response) => {
                    expect(response.status).to.equal(204);
                    expect(response.body).to.equal("");
                });
            });
        });
    });

    it('Deve ser possível que um usuário com perfil Administrador, exclua a própria conta', function () {
        cy.deleteUser(usuarioCriado).then((response) => {
            expect(response.status).to.equal(204);
            expect(response.body).to.equal("");
        });
    });

    it('Não deve ser possível visualizar as informações de uma review feita por um usuário em determinado filme, após a exclusão do usuário', function () {

        cy.login(usuarioCriado).then((login) => {
            token = login.body.accessToken
        }).then(function () {
            cy.promoteAdmin(token).then(function () {
                cy.createMovie({
                    title: "Por lugares incríveis",
                    genre: "Romance/Drama",
                    description: "Dois adolescentes que estão passando por momentos difíceis criam um forte laço quando embarcam em uma jornada transformadora para visitar as maravilhas do estado de Indiana, nos Estados Unidos.",
                    durationInMinutes: 108,
                    releaseYear: 2020
                }, token).then((movie) => {
                    filmeCriado = movie.body
                }).then(function () {
                    cy.reviewMovie(filmeCriado.id, 5, "Amei! Adoro filmes de romance dramáticos", token).then(function () {
                        cy.request({
                            method: 'DELETE',
                            url: 'https://raromdb-3c39614e42d4.herokuapp.com/api/users/' + usuarioCriado.id,
                            auth: {
                                bearer: token,
                            },

                        }).then(function () {
                            cy.getMovie(filmeCriado.id).then((response) => {
                                expect(response.status).to.equal(200);
                                expect(response.body.reviews).to.be.an("array");
                                expect(response.body.reviews.length).to.equal(0)
                            })
                        })
                    })
                });
            });
        });
    });
});