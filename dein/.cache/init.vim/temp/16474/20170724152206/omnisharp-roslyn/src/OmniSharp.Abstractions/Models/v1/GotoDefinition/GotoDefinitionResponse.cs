using Newtonsoft.Json;
using OmniSharp.Models.Metadata;

namespace OmniSharp.Models.GotoDefinition
{
    public class GotoDefinitionResponse
    {
        public string FileName { get; set; }
        [JsonConverter(typeof(ZeroBasedIndexConverter))]
        public int Line { get; set; }
        [JsonConverter(typeof(ZeroBasedIndexConverter))]
        public int Column { get; set; }
        public MetadataSource MetadataSource { get; set; }
    }
}
