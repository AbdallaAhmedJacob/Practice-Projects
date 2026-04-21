#pragma once
#include <string>
#include <vector>

class clsCrypt
{
private:

    // =============================
    //          XOR Core
    // =============================
    static std::string XOR_Encrypt(const std::string& text, const std::string& key)
    {
        std::string output = text;
        for (size_t i = 0; i < text.length(); i++)
        {
            output[i] = text[i] ^ key[i % key.length()];
        }
        return output;
    }


    // =============================
    //          Base64
    // =============================
    static std::string Base64Encode(const std::string& in)
    {
        static const std::string chars =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            "abcdefghijklmnopqrstuvwxyz"
            "0123456789+/";

        std::string out;
        int val = 0, valb = -6;

        for (unsigned char c : in)
        {
            val = (val << 8) + c;
            valb += 8;

            while (valb >= 0)
            {
                out.push_back(chars[(val >> valb) & 0x3F]);
                valb -= 6;
            }
        }

        if (valb > -6)
            out.push_back(chars[((val << 8) >> (valb + 8)) & 0x3F]);

        while (out.size() % 4)
            out.push_back('=');

        return out;
    }

    static std::string Base64Decode(const std::string& in)
    {
        static std::vector<int> T(256, -1);

        static bool initialized = false;
        if (!initialized)
        {
            std::string chars =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                "abcdefghijklmnopqrstuvwxyz"
                "0123456789+/";

            for (int i = 0; i < 64; i++)
                T[chars[i]] = i;

            initialized = true;
        }

        std::string out;
        int val = 0, valb = -8;

        for (unsigned char c : in)
        {
            if (T[c] == -1) break;

            val = (val << 6) + T[c];
            valb += 6;

            if (valb >= 0)
            {
                out.push_back(char((val >> valb) & 0xFF));
                valb -= 8;
            }
        }

        return out;
    }

public:

    // =============================
    //     Encrypt / Decrypt API
    // =============================
    static std::string Encrypt(const std::string& text, const std::string& key)
    {
        return Base64Encode(XOR_Encrypt(text, key));
    }

    static std::string Decrypt(const std::string& text, const std::string& key)
    {
        return XOR_Encrypt(Base64Decode(text), key);
    }
};
