﻿using FC.Codeflix.Catalog.Application.UseCases.Category.CreateCategory;
using DomainEntity = FC.Codeflix.Catalog.Domain.Entity;
using FC.Codeflix.Catalog.Domain.Exceptions;
using FluentAssertions;
using Moq;
using UseCases = FC.Codeflix.Catalog.Application.UseCases.Category.CreateCategory;

namespace FC.Codeflix.Catalog.UnitTests.Application.Category.CreateCategory
{
    [Collection(nameof(CreateCategoryTestFixture))]
    public class CreateCategoryTest
    {

        private readonly CreateCategoryTestFixture _fixture;

        public CreateCategoryTest(CreateCategoryTestFixture fixture)
        {
            _fixture = fixture;
        }

        [Fact(DisplayName = "Create Category")]
        [Trait("Application", "CreateCategory - Use Cases - Trait Tests")]
        public async void Validar_NovaCategory_DeveCriarUmaNovaCategoria()
        {
            var repositoryMock = _fixture.GetRepositoryMock();
            var unitOfWorkMock = _fixture.GetUnitOfWorkMock();

            var useCase = new UseCases.CreateCategory(
                repositoryMock.Object,
                unitOfWorkMock.Object
            );
            var input = _fixture.GetInput();

            var output = await useCase.Handle(input, CancellationToken.None);

            repositoryMock.Verify(
                repository => repository.Insert(
                    It.IsAny<DomainEntity.Category>(),
                    It.IsAny<CancellationToken>()
                ),
                Times.Once
            );
            unitOfWorkMock.Verify(
                uow => uow.Commit(It.IsAny<CancellationToken>()),
                Times.Once
            );
            output.Should().NotBeNull();
            output.Name.Should().Be(input.Name);
            output.Description.Should().Be(input.Description);
            output.IsActive.Should().Be(input.IsActive);
            output.Id.Should().NotBeEmpty();
            output.CreatedAt.Should().NotBeSameDateAs(default);
        }

        [Fact(DisplayName = "Create Category With Only Name")]
        [Trait("Application", "CreateCategory - Use Cases - Trait Tests")]
        public async void Validar_NovaCategoria_DeveCriarUmaNovaCategoriaSomenteComNomePreenchido()
        {
            var repositoryMock = _fixture.GetRepositoryMock();
            var unitOfWorkMock = _fixture.GetUnitOfWorkMock();

            var useCase = new UseCases.CreateCategory(
                repositoryMock.Object,
                unitOfWorkMock.Object
            );
            var input = new CreateCategoryInput(_fixture.GetValidCategoryName());

            var output = await useCase.Handle(input, CancellationToken.None);

            repositoryMock.Verify(
                repository => repository.Insert(
                    It.IsAny<DomainEntity.Category>(),
                    It.IsAny<CancellationToken>()
                ),
                Times.Once
            );
            unitOfWorkMock.Verify(
                uow => uow.Commit(It.IsAny<CancellationToken>()),
                Times.Once
            );
            output.Should().NotBeNull();
            output.Name.Should().Be(input.Name);
            output.Description.Should().Be("");
            output.IsActive.Should().BeTrue();
            output.Id.Should().NotBeEmpty();
            output.CreatedAt.Should().NotBeSameDateAs(default);
        }

        [Fact(DisplayName = "Create Category With Only Name And Description")]
        [Trait("Application", "CreateCategory - Use Cases - Trait Tests")]
        public async void Validar_NovaCategoria_DeveCriarUmaNovaCategoriaSomenteComNomeEDescriptionPreenchidos()
        {
            var repositoryMock = _fixture.GetRepositoryMock();
            var unitOfWorkMock = _fixture.GetUnitOfWorkMock();

            var useCase = new UseCases.CreateCategory(
                repositoryMock.Object,
                unitOfWorkMock.Object
            );
            var input = new CreateCategoryInput(
                _fixture.GetValidCategoryName(),
                _fixture.GetValidCategoryDescription()
            );

            var output = await useCase.Handle(input, CancellationToken.None);

            repositoryMock.Verify(
                repository => repository.Insert(
                    It.IsAny<DomainEntity.Category>(),
                    It.IsAny<CancellationToken>()
                ),
                Times.Once
            );
            unitOfWorkMock.Verify(
                uow => uow.Commit(It.IsAny<CancellationToken>()),
                Times.Once
            );
            output.Should().NotBeNull();
            output.Name.Should().Be(input.Name);
            output.Description.Should().Be(input.Description);
            output.IsActive.Should().BeTrue();
            output.Id.Should().NotBeEmpty();
            output.CreatedAt.Should().NotBeSameDateAs(default);
        }

        [Theory(DisplayName = "Create Category Error")]
        [Trait("Application", "CreateCategory - Use Cases - Trait Tests")]
        [MemberData(
            nameof(CreateCategoryTestDataGenerator.GetInvalidInputs),
            parameters: 12,
            MemberType = typeof(CreateCategoryTestDataGenerator)
        )]
        public async void Validar_NovaCategory_DeveDarErroAoCriarUmaNovaCategoria(
            CreateCategoryInput input,
            string exceptionMessage)
        {
            var useCase = new UseCases.CreateCategory(
                _fixture.GetRepositoryMock().Object,
                _fixture.GetUnitOfWorkMock().Object
            );
            Func<Task> task = async () => await useCase.Handle(input, CancellationToken.None);

            await task.Should()
                .ThrowAsync<EntityValidationException>()
                .WithMessage(exceptionMessage);
        }
    }
}
