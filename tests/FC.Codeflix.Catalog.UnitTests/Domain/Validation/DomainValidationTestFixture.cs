using FC.Codeflix.Catalog.UnitTests.Common;

namespace FC.Codeflix.Catalog.UnitTests.Domain.Validation
{
    public class DomainValidationTestFixture : BaseFixture
    {
        public DomainValidationTestFixture()
            : base() { }

        public string GetValidDomainValidationFieldColumn()
        {
            var fieldColumn = Faker.Commerce.ProductName().Substring(0, 5).Replace(" ", "");

            return fieldColumn;
        }

    }

    [CollectionDefinition(nameof(DomainValidationTestFixture))]
    public class DomainValidationTestFixtureCollection
        : ICollectionFixture<DomainValidationTestFixture>
    {

    }
}
