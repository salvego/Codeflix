using FC.Codeflix.Catalog.Domain.Exceptions;
using FluentAssertions;
using DomainCategory = FC.Codeflix.Catalog.Domain.Entity;


namespace FC.Codeflix.Catalog.UnitTests.Domain.Entity.Category
{
    [Collection(nameof(CategoryTestFixture))]
    public class CategoryTest
    {
        private readonly CategoryTestFixture _categoryTestFixture;

        public CategoryTest(CategoryTestFixture categoryTestFixture)
        {
            _categoryTestFixture = categoryTestFixture;
        }

        [Fact(DisplayName = "New Category Valid")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveCriarUmaNovaCategoria()
        {
            //Arrange
            var validCategory = _categoryTestFixture.GetValidCategory();
            //Act
            var category = new DomainCategory.Category(validCategory.Name, validCategory.Description);
            //Assert
            category.Should().NotBeNull();
            category.Name.Should().Be(validCategory.Name);
            category.Description.Should().Be(validCategory.Description);
            category.Id.Should().NotBe(default(Guid));
            category.CreatedAt.Should().NotBe(default(DateTime));
            category.IsActive.Should().BeTrue();
        }

        [Theory(DisplayName = "New Category IsActive")]
        [Trait("Category", "Category Trait Tests")]
        [InlineData(true)]
        [InlineData(false)]
        public void Validar_Categoria_DeveCriarUmaNovaCategoriaComStatusDeAtivoOuInativo(bool isActive)
        {
            //Arrange
            var validCategory = _categoryTestFixture.GetValidCategory();
            //Act
            var category = new DomainCategory.Category(validCategory.Name, validCategory.Description, isActive);
            //Assert
            category.Should().NotBeNull();
            category.Name.Should().Be(validCategory.Name);
            category.Description.Should().Be(validCategory.Description);
            category.Id.Should().NotBe(default(Guid));
            category.CreatedAt.Should().NotBe(default(DateTime));
            category.IsActive.Should().Be(isActive);
        }

        [Theory(DisplayName = "New Category With Name not is Empty or Null")]
        [Trait("Category", "Category Trait Tests")]
        [InlineData("")]
        [InlineData(null)]
        [InlineData("  ")]
        public void Validar_Categoria_DeveCriarComNomeDiferenteDeVazioOuNulo(string? name)
        {
            var validCategory = _categoryTestFixture.GetValidCategory();
            //Act
            Action action =
                () => new DomainCategory.Category(name, validCategory.Description);
            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Name should not be empty or null");
        }

        [Theory(DisplayName = "New Category With Name in on Min 3 caracteres")]
        [Trait("Category", "Category Trait Tests")]
        [MemberData(nameof(GetValidar_Categoria_DeveCriarComNomeDeNoMinimo3Caracteres), parameters:10)]
        public void Validar_Categoria_DeveCriarComNomeDeNoMinimo3Caracteres(string? name)
        {
            var validCategory = _categoryTestFixture.GetValidCategory();
            //Act
            Action action =
                () => new DomainCategory.Category(name, validCategory.Description);

            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Name should be at leats 3 caracters long");
        }
        public static IEnumerable<object[]> GetValidar_Categoria_DeveCriarComNomeDeNoMinimo3Caracteres(int numeroTestes)
        {
            var fixture = new CategoryTestFixture();
            for(int i = 0; i < numeroTestes; i++)
            {
                var imparPar = i % 2 == 1;
                yield return new object[]
                {
                    fixture.GetValidCategoryName()[..(imparPar ? 1 : 2)]
                };
            }
        }

        [Fact(DisplayName = "New Category With Name less or equal 255 caracters")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveCriarComNomeMenorOuIgual255Caracteres()
        {
            var validCategory = _categoryTestFixture.GetValidCategory();
            //var invalidName = String.Join(null, Enumerable.Range(1,256).Select(i => "a").ToArray());
            var invalidName = _categoryTestFixture.Faker.Lorem.Letter(256);
            //Act
            Action action =
                () => new DomainCategory.Category(invalidName, validCategory.Description);

            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Name should be less or equal 255 caracteres");
        }

        [Fact(DisplayName = "New Category With Description less or equal 10000 caracters")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveCriarComDescricaoMenorOuIgual10000Caracteres()
        {
            var validCategory = _categoryTestFixture.GetValidCategory();
            //var invalidDescription = String.Join(null, Enumerable.Range(1, 10001).Select(i => "a").ToArray());
            var invalidDescription = _categoryTestFixture.Faker.Commerce.ProductDescription();

            while (invalidDescription.Length <= 10000)
            {
                invalidDescription = $"{invalidDescription} {_categoryTestFixture.Faker.Commerce.ProductDescription()}";
            }

            //Act
            Action action =
                () => new DomainCategory.Category(validCategory.Name, invalidDescription);

            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Description should be less or equal 10000 caracteres");
        }

        [Fact(DisplayName = "New Category With Function in Active")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveAtivarAtravesDeUmaFuncao()
        {
            //Arrange
            var validCategory = _categoryTestFixture.GetValidCategory();
            var category = new DomainCategory.Category(validCategory.Name, validCategory.Description, false);
            //Act
            category.Activate();
            //Assert
            category.IsActive.Should().BeTrue();
        }

        [Fact(DisplayName = "New Category With Function in Disable")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveDesativarAtravesDeUmaFuncao()
        {
            //Arrange
            var validCategory = _categoryTestFixture.GetValidCategory();
            var category = new DomainCategory.Category(validCategory.Name, validCategory.Description, true);
            //Act
            category.Deactivate();
            //Assert
            category.IsActive.Should().BeFalse();
        }

        [Fact(DisplayName = "Update Category")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveModificarNomeEDescricao()
        {
            //Arrange
            var validCategory = _categoryTestFixture.GetValidCategory();
            var category = new DomainCategory.Category(validCategory.Name, validCategory.Description, true);
            //Act
            category.Update("Category Name Atualizada", "Category Description Atualizada");
            //Assert
            category.Name.Should().NotBe(validCategory.Name);
            category.Description.Should().NotBe(validCategory.Description);
        }

        [Fact(DisplayName = "Update Only Name in Category")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveModificarSomenteNome()
        {
            //Arrange
            var validCategory = _categoryTestFixture.GetValidCategory();
            var category = new DomainCategory.Category(validCategory.Name, validCategory.Description, true);
            //Act
            category.Update("Category Name Atualizada");
            //Assert
            category.Name.Should().NotBe(validCategory.Name);
        }

        [Theory(DisplayName = "Update Category With Name not is Empty or Null")]
        [Trait("Category", "Category Trait Tests")]
        [InlineData("")]
        [InlineData(null)]
        [InlineData("  ")]
        public void Validar_Categoria_DeveAtualizarNomeDiferenteDeVazioOuNulo(string? name)
        {
            var validCategory = _categoryTestFixture.GetValidCategory();
            var category = new DomainCategory.Category(validCategory.Name, validCategory.Description, true);
            //Act
            Action action =
                () => category.Update(name);
            
            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Name should not be empty or null");
        }

        [Theory(DisplayName = "Update Category With Name in on Min 3 caracteres")]
        [Trait("Category", "Category Trait Tests")]
        [InlineData("V")]
        [InlineData("D")]
        [InlineData("Se")]
        [InlineData("RI")]
        public void Validar_Categoria_DeveAtualizarNomeDeNoMinimo3Caracteres(string? name)
        {
            var category = _categoryTestFixture.GetValidCategory();
            //Act
            Action action =
                () => category.Update(name);

            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Name should be at leats 3 caracters long");
        }

        [Fact(DisplayName = "Update Category With Name less or equal 255 caracters")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveAtualizarNomeMenorOuIgual255Caracteres()
        {

            var invalidName = String.Join(null, Enumerable.Range(1, 256).Select(i => "a").ToArray());
            var category = _categoryTestFixture.GetValidCategory();
            //Act

            //Act
            Action action =
                () => category.Update(invalidName);

            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Name should be less or equal 255 caracteres");
        }

        [Fact(DisplayName = "Update Category With Description less or equal 10.000 caracters")]
        [Trait("Category", "Category Trait Tests")]
        public void Validar_Categoria_DeveAtualizarDescricaoMenorOuIgual10000Caracteres()
        {

            var invalidDescription = String.Join(null, Enumerable.Range(1, 10001).Select(i => "a").ToArray());
            var category = _categoryTestFixture.GetValidCategory();
            //Act
            Action action =
                () => category.Update(category.Name, invalidDescription);

            //Assert
            action.Should()
                .Throw<EntityValidationException>()
                .WithMessage("Description should be less or equal 10000 caracteres");
        }
    }
}
